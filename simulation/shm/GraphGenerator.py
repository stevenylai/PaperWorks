import random
import math
import operator

class Edge:
	id=0
	v1=0
	v2=0
	length=0
	def __init__(self, v1, v2):
		self.id=0
		self.v1=v1
		self.v2=v2
		self.length=math.sqrt((v1.x-v2.x)*(v1.x-v2.x)+(v1.y-v2.y)*(v1.y-v2.y))
		v1.degree=v1.degree+1
		v2.degree=v2.degree+1
	def __str__(self):
		return 'Edge ['+str(self.v1)+', '+str(self.v2)+']: '+str(self.length)
	def __repr__(self):
		return self.__str__()
class Vertex:
	id=0
	x=0
	y=0
	degree=0
	def __init__(self, x, y):
		self.id=0
		self.x=x
		self.y=y
	def __str__(self):
		return 'Vertex ['+str(self.id)+'] ('+str(self.x)+', '+str(self.y)+'): '+str(self.degree)
	def __repr__(self):
		return self.__str__()

class AjacencyEntry:
	v1=None
	v2=None
	edges=None
	def __init__(self, v1, v2):
		self.v1=v1
		self.v2=v2
		self.edges=[]
	def __str__(self):
		return str(len(self.edges))
	def __repr__(self):
		return self.__str__()

class WeightedGraph:
	area=(0,0)
	vertices=None
	edges=None
	ajacency=None
	def __init__(self):
		self.area=(0,0)
		self.vertices=[]
		self.edges=[]
		self.ajacency=None
	def getMatlabInput(self):
		vertexStr='vertex=['
		for i in range(0, len(self.vertices)):
			if i<len(self.vertices)-1:
				vertexStr=vertexStr+str(self.vertices[i].x)+', '+str(self.vertices[i].y)+'; '
			else:
				vertexStr=vertexStr+str(self.vertices[i].x)+', '+str(self.vertices[i].y)+']'

		edgeStr='edge=['
		for i in range(0, len(self.edges)):
			if i<len(self.edges)-1:
				edgeStr=edgeStr+str(self.vertices.index(self.edges[i].v1)+1)+', '+str(self.vertices.index(self.edges[i].v2)+1)+'; '
			else:
				edgeStr=edgeStr+str(self.vertices.index(self.edges[i].v1)+1)+', '+str(self.vertices.index(self.edges[i].v2)+1)+']'
		return vertexStr+'\n'+edgeStr
	def printGraph(self):
		for v in self.vertices:
			print (v)
		for e in self.edges:
			print (e)
	def addVertex(self, x, y):
		v=Vertex(x, y)
		self.vertices.append(v)
		return v
	def removeEdge(self, edge):
		edge.v1.degree=edge.v1.degree-1
		edge.v2.degree=edge.v2.degree-1
		self.edges.remove(edge)
	def addEdge(self, v1, v2):
		newEdge=Edge(v1, v2)
		self.edges.append(newEdge)
		return newEdge
	def toAjacencyForm(self):
		self.ajacency=[]
		for v1 in self.vertices:
			ajacencyRow=[]
			for v2 in self.vertices:
				ajacencyRow.append(AjacencyEntry(v1, v2))
			self.ajacency.append(ajacencyRow)

		for e in self.edges:
			self.ajacency[e.v1.id][e.v2.id].edges.append(e)
			self.ajacency[e.v2.id][e.v1.id].edges.append(e)

		return self.ajacency
	def displayAjacencyForm(self):
		if self.ajacency==None:
			self.toAjacencyForm()
		for row in self.ajacency:
			colStr=''
			for col in row:
				colStr=colStr+str(col)+' '
			print (colStr)
class GraphGenerator:
	graph=None
	nodeNumber=0
	minDegree=0

	def __init__(self):
		pass
	def processIncidentList(self, V, E):
		for i in range(0, len(V)):
			v=Vertex(V[i][0], V[i][1])
			v.id=i
			self.graph.vertices.append(v)
		for i in range(0, len(E)):
			self.graph.addEdge(self.graph.vertices[E[i][0]-1], self.graph.vertices[E[i][1]-1])
	def generateVertices(self):
		for i in range(0, self.nodeNumber):
			x=random.randint(0, self.graph.area[0])
			y=random.randint(0, self.graph.area[1])
			while (self.addVertex(x,y)==None):
				x=random.randint(0, self.graph.area[0])
				y=random.randint(0, self.graph.area[1])
	def addVertex(self, x, y):
		for v in self.graph.vertices:
			if v.x==x and v.y==y:
				return None
		v=self.graph.addVertex(x,y)
		self.addEdges(v)
		return v
	def addEdges(self, vertex):
		for v in self.graph.vertices:
			if v.x!=vertex.x or v.y!=vertex.y:
				self.graph.addEdge(v, vertex)
	def sortGraph(self):
		self.graph.edges=sorted(self.graph.edges, key=operator.attrgetter('length'))
		self.graph.vertices=sorted(self.graph.vertices, key=operator.attrgetter('degree'))
	def longestEdge(self):
		self.sortGraph()
		return self.graph.edges[len(self.graph.edges)-1]
	def pruneGraph(self):
		self.sortGraph()
		removedEdges=[]
		lastLen=self.graph.edges[len(self.graph.edges)-1].length+1

		while self.graph.vertices[0].degree>=self.minDegree:
			candidate=self.graph.edges[len(self.graph.edges)-1]
			if candidate.length!=lastLen:
				removedEdges=[]
			removedEdges.append((candidate.v1, candidate.v2))

			lastLen=candidate.length
			self.graph.removeEdge(candidate)
			self.sortGraph()
			#if self.graph.vertices[0].degree<self.minDegree:
				#print ("Attempting to remove edge:", candidate, "Graph degree:", self.graph.vertices[0].degree)

		for e in removedEdges:
			addedEdge=self.graph.addEdge(e[0], e[1])
			#print ("Adding back edge:", addedEdge)

	def generateEdges(self, area, minDegree, V):
		self.graph=WeightedGraph()
		self.graph.area=area
		self.nodeNumber=len(V)
		self.minDegree=minDegree

		for i in range(0, len(V)):
			v=self.graph.addVertex(V[i][0], V[i][1])
			v.id=i
			self.addEdges(v)

		self.pruneGraph()
		self.sortGraph()

		return self.graph
	def readGraph(self, area, V, E):
		self.graph=WeightedGraph()
		self.graph.area=area
		self.nodeNumber=len(V)

		self.processIncidentList(V, E)
		self.sortGraph()
		self.calculateMinDegree()

		return self.graph
	def calculateMinDegree(self):
		self.sortGraph()
		self.minDegree=self.graph.vertices[0].degree
	def generate(self, area, nodeNumber, minDegree):
		self.graph=WeightedGraph()
		self.graph.area=area
		self.nodeNumber=nodeNumber
		self.minDegree=minDegree

		self.generateVertices()
		self.pruneGraph()
		self.sortGraph()

		return self.graph

if __name__ == "__main__":
	generator = GraphGenerator()
	#graph = generator.readGraph((20, 20), 3, V, E)
	#graph = generator.generate((20, 20), 40, 3)
	graph = generator.generateEdges((20, 20), 3, [[9,9], [1,3], [16,6], [2,12], [16,3], [15,14], [17,4], [6,18], [7,5], [6,15], [15,3], [14,5], [16,1], [10,11], [13,13], [18,10], [10,8], [17,12], [19,12], [11,13], [14,12], [18,18], [3,4], [3,14], [14,4], [7,2], [0,9], [3,9], [4,13], [8,15], [0,7], [6,8], [16,16], [13,16], [2,5], [5,12], [12,11], [16,10], [7,17], [5,5]])
	graph.printGraph()
	#print(graph.getMatlabInput())

	#for i in range(0, len(graph.vertices)):
		#graph.vertices[i].id=i
	#graph.displayAjacencyForm()

