from GraphGenerator import *
import operator
import math

class STATUS:
	UC=0
	CH=1
	CM=2
class VertexInfo:
	graph=None
	vertex=None
	cn=None
	un=None
	clusterStatus=STATUS.UC
	verticesInfo=None
	reached=False
	def __init__(self, graph, verticesInfo, vertex):
		self.graph=graph
		self.verticesInfo=verticesInfo
		self.vertex=vertex
		self.clusterStatus=STATUS.UC
		self.reached=False
	def getNeighborList(self):
		self.cn=[]
		self.un=[]
		for ajacency in self.graph.ajacency[self.vertex.id]:
			for e in ajacency.edges:
				if e.v1!=self.vertex:
					if self.verticesInfo[e.v1.id].clusterStatus==STATUS.UC:
						self.un.append(e.v1)
					else:
						self.cn.append(e.v1)
				if e.v2!=self.vertex:
					if self.verticesInfo[e.v2.id].clusterStatus==STATUS.UC:
						self.un.append(e.v2)
					else:
						self.cn.append(e.v2)
	def __str__(self):
		return str(self.vertex)+" CN: "+str(self.cn)+" UN: "+str(self.un)
	def __repr__(self):
		return self.__str__()
#New parameters
class SysParameters:
	nd =24
	overlap =0.5
	nfft = 2048  
	N = (nd/2+0.5)*nfft
	eS =200/(512*3600)
	eR = 200/(100*3600)
	eT = eR
	eNexT  = 150*12/3600
#Parameters for InfoComm paper
class SysParameters2:
	N  = 10752
	nfft = 1024
	nd = 20
	eS = 0.00010851
	eR = 0.0005
	eT = 0.0005
	eNexT	= 0.5
class ClusterInfo:
	ch=None
	cm=None

	def __init__(self, ch):
		self.ch=ch
		self.cm=[]
	def size(self):
		return len(self.cm)+1
	def cost(self, graph):
		N 	= SysParameters.N
		nfft	= SysParameters.nfft
		nd	= SysParameters.nd
		eS	= SysParameters.eS
		eR	= SysParameters.eR
		eT	= SysParameters.eT
		eNexT	= SysParameters.eNexT

		ni	= self.size()
		eERA	=150.0/3600*(0.4*ni*ni+1.2*ni-3.6)

		Erc = N*eT+(ni-1)*N*eR + nfft/2*(ni-1)*(eR+eT)
		Era = eERA + ni*eNexT

		return Erc + Era
	def wirelessCommCost(self):
		N 	= SysParameters.N
		nfft	= SysParameters.nfft

		ni	= self.size()

		#Modified for new cost calculation (for the new version to be submitted to TOSN)
		wirelessComm = N+ nfft*(ni-1)
		return wirelessComm
	def __str__(self):
		allStr="Cluster ["+str(self.ch.id)+"]={"
		for i in range(0, len(self.cm)):
			if i<len(self.cm)-1:
				allStr=allStr+str(self.cm[i].id)+", "
			else:
				allStr=allStr+str(self.cm[i].id)+"}"
		return allStr
	def __repr__(self):
		return self.__str__()
class DistCluster:
	minDegree=0
	optClusterSize=0

	verticesInfo=None
	timeSlots=None
	currentTimeSlot=0
	graph=None
	totalMsg=0
	clusterInfo=None
	def __init__(self, graph, minDegree, optClusterSize):
		self.graph=graph
		self.minDegree=minDegree
		self.optClusterSize=optClusterSize

		self.currentTimeSlot=0
		self.totalMsg=0
	def test(self):
		self.initialize()
		self.processTimeSlot()
		while self.nextTimeSlot():
			self.processTimeSlot()
		print (self.clusterInfo)
		print ("Finished, message used:", self.totalMsg)
		print ("Cost by using this clustering:", self.getCost())
	def getCost(self):
		totalCost=0
		for c in self.clusterInfo:
			totalCost=totalCost+c.cost(self.graph)
		#Modified for new cost calculation (for the new version to be submitted to TOSN)
		#return totalCost+len(self.graph.vertices)*SysParameters.N*SysParameters.eS
		return totalCost
	def processTimeSlot(self):
		nodeIDs=self.timeSlots[self.currentTimeSlot]
		for n in nodeIDs:
			v=self.verticesInfo[n]
			v.getNeighborList()
			v.reached=True

			#Sort the neighbors according to their cost (number of unclustered neighbors)
			for neighbor in v.un:
				self.verticesInfo[neighbor.id].getNeighborList()
			v.un=sorted(v.un, key=lambda vertex: len(self.verticesInfo[vertex.id].un))
			for neighbor in v.cn:
				self.verticesInfo[neighbor.id].getNeighborList()
			v.cn=sorted(v.cn, key=lambda vertex: len(self.verticesInfo[vertex.id].un))

			if v.clusterStatus==STATUS.UC:
				v.clusterStatus=STATUS.CH
				#print ("["+str(self.currentTimeSlot)+"]: Processing node", v)
				self.processCH(v)
				self.msgAccount(len(v.un))
			elif v.clusterStatus==STATUS.CH:
				#print ("["+str(self.currentTimeSlot)+"]: Processing node", v)
				self.processCH(v)
				self.msgAccount(len(v.un))
			elif v.clusterStatus==STATUS.CM:
				self.processCM(v)
				self.msgAccount(1)

			self.scheduleNeighbors(v)

	def findCluster(self, v):
		for c in self.clusterInfo:
			if c==v:
				return c
		return None
	def processCM(self, v):
		#Do nothing
		pass
	def processCH(self, v):
		cluster=self.findCluster(v.vertex)
		if cluster==None:
			#print("Creating new cluster with "+str(v.vertex.id)+" as CH")
			cluster=ClusterInfo(v.vertex)
			self.clusterInfo.append(cluster)
		else:
			return

		#Processing overlapper
		if len(v.cn)>0:
			cluster.cm.append(v.cn[0])
			v.cn.remove(v.cn[0])

		#Processing neighbors
		if len(v.un)>=self.optClusterSize-cluster.size():
			#print("Cluster size can be optimal")
			i=0
			while cluster.size()<self.optClusterSize:
				cluster.cm.append(v.un[i])
				if self.verticesInfo[v.un[i].id].clusterStatus==STATUS.UC:
					self.verticesInfo[v.un[i].id].clusterStatus=STATUS.CM
				i=i+1
		elif len(v.un)>=self.minDegree+1-cluster.size():
			i=0
			#QUESTION: Add only up to min degree or add all unclustered members?
			#while cluster.size()<self.minDegree:
			while i<len(v.un):
				cluster.cm.append(v.un[i])
				if self.verticesInfo[v.un[i].id].clusterStatus==STATUS.UC:
					self.verticesInfo[v.un[i].id].clusterStatus=STATUS.CM
				i=i+1
		else:
			for n2 in v.un:
				cluster.cm.append(n2)
				if self.verticesInfo[n2.id].clusterStatus==STATUS.UC:
					self.verticesInfo[n2.id].clusterStatus=STATUS.CM
			i=0
			while cluster.size()<self.minDegree+1:
				cluster.cm.append(v.cn[i])
				if self.verticesInfo[v.cn[i].id].clusterStatus==STATUS.UC:
					self.verticesInfo[v.cn[i].id].clusterStatus=STATUS.CM
				i=i+1
	def scheduleTimeSlot(self, id, offset):
		targetTimeSlot=self.currentTimeSlot+1
		if len(self.timeSlots)-1<targetTimeSlot:
			#print ("Expanding time slot by", targetTimeSlot-len(self.timeSlots)+1)
			for i in range(0, targetTimeSlot-len(self.timeSlots)+1):
				self.timeSlots.append([])
		self.timeSlots[targetTimeSlot].append(id)
	def scheduleNeighbors(self, v):
		overall=1
		i=0
		j=0
		#QUESTION: lowest cost first or highest cost first?
		while i<len(v.un) and j<len(v.cn):
			if len(self.verticesInfo[v.un[i].id].un)<len(self.verticesInfo[v.cn[j].id].un):
				candidate=self.verticesInfo[v.un[i].id]
				i=i+1
			else:
				candidate=self.verticesInfo[v.cn[j].id]
				j=j+1
			if not candidate.reached:
				self.scheduleTimeSlot(candidate.vertex.id, overall)
				candidate.reached=True
				overall=overall+1
		while i<len(v.un):
			if not self.verticesInfo[v.un[i].id].reached:
				self.scheduleTimeSlot(v.un[i].id, overall)
				self.verticesInfo[v.un[i].id].reached=True
				overall=overall+1
			i=i+1
		while j<len(v.cn):
			if not self.verticesInfo[v.cn[j].id].reached:
				self.scheduleTimeSlot(v.cn[j].id, overall)
				self.verticesInfo[v.cn[j].id].reached=True
				overall=overall+1
			j=j+1
	def msgAccount(self, toAdd):
		self.totalMsg=self.totalMsg+toAdd
	def nextTimeSlot(self):
		self.currentTimeSlot=self.currentTimeSlot+1
		if self.currentTimeSlot>len(self.timeSlots)-1:
			return False
		else:
			return True
	def initialize(self):
		#index of verticesInfo must be equal to v.id
		self.verticesInfo=[]
		for i in range(0, len(self.graph.vertices)):
			self.verticesInfo.append(None)

		for v in self.graph.vertices:
			self.verticesInfo[v.id]=VertexInfo(self.graph, self.verticesInfo, v)

		self.timeSlots=[]
		self.currentTimeSlot=0
		#The node with the most degree/neighbor will start first (be treated as controller/sink)
		self.timeSlots.append([self.graph.vertices[len(self.graph.vertices)-1].id])

		self.totalMsg=0
		self.clusterInfo=[]

class Tester:
	generator=None
	def readGraph(self, area, V, E):
		self.generator = GraphGenerator()
		graph = self.generator.readGraph(area, V, E)
		graph.toAjacencyForm()
		#graph.displayAjacencyForm()
		return graph
	def generateGraph(self, area, nodeNum, minDegree):
		self.generator = GraphGenerator()
		graph = self.generator.generate(area, nodeNum, minDegree)
		for i in range(0, len(graph.vertices)):
			graph.vertices[i].id=i
		graph.toAjacencyForm()
		#graph.displayAjacencyForm()
		return graph

	def preconfiguredTest(self):
		V2=[[0, 0], [15, 3], [24, 0], [33, 3], [1, 6], [16, 6], [25, 6], [34, 6], [1, 12], [14, 12], [23, 12], [32, 12], [1, 18], [16, 18], [25, 18], [34, 18], [1, 24], [14, 24], [23, 24], [32, 24]]
		E4=[[1, 2], [1, 5], [1, 10], [2, 4], [2, 5], [2, 7], [2, 10], [2, 11], [2, 14], [3, 4], [3, 6], [3, 7], [3, 8], [3, 10], [3, 11], [4, 6], [4, 7], [4, 8], [4, 12], [4, 15], [4, 16], [5, 6], [5, 9], [5, 10], [5, 13], [6, 7], [6, 8], [6, 10], [6, 11], [6, 14], [6, 15], [7, 8], [7, 11], [7, 12], [7, 14], [8, 11], [8, 15], [8, 16], [9, 10], [9, 13], [9, 17], [10, 11], [10, 12], [10, 14], [10, 15], [10, 18], [11, 12], [11, 14], [11, 15], [11, 16], [11, 18], [11, 19], [11, 20], [12, 15], [12, 19], [12, 20], [13, 17], [13, 18], [14, 16], [14, 18], [14, 19], [14, 20], [15, 16], [15, 18], [15, 19], [16, 19], [17, 18], [18, 19], [18, 20]]

		allCost=[]
		for V, E in [(V2, E4)]:
			graphCost=[]
			#for eT, nopt in [(0.0005, 6), (0.001, 7), (0.0015, 8), (0.002, 9), (0.0025, 10)]:
			for eT, nopt in [(SysParameters.eR, 8)]:
				SysParameters.eT=SysParameters.eR
				g=self.readGraph((100, 100), V, E)
				sim=DistCluster(g, self.generator.minDegree, nopt)
				sim.test()
				graphCost.append(sim.getCost())
			allCost.append(graphCost)
		print (allCost)
	def autoTest(self):
		allCost=[]
		for minDegree in [3, 4, 5]:
			graphCost=[]
			#for eT, nopt in [(0.0005, 6), (0.001, 7), (0.0015, 8), (0.002, 9), (0.0025, 10)]:
			#Modified for new cost calculation (for the new version to be submitted to TOSN)
			for eT, nopt in [(0.0005, 10000)]:
				SysParameters.eT=eT
				totalCost=0
				repeat=10
				for i in range(0, repeat):
					g=self.generateGraph((20, 20), 40, minDegree)
					sim=DistCluster(g, minDegree, nopt)
					sim.test()
					totalCost=totalCost+sim.getCost()
				graphCost.append(totalCost/repeat)
			allCost.append(graphCost)
		print (allCost)
	def simpleTest(self):
		g=self.generateGraph((20, 20), 40, 3)
		#SysParameters.eT=eT
		sim=DistCluster(g, 3, 6)
		sim.test()
if __name__ == "__main__":
	t=Tester()
	#t.simpleTest()
	#t.autoTest()
	t.preconfiguredTest()
