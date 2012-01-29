import time
import random
import math

class Simulator:
	size=None
	sink=None

	fusionPoints=None
	fusionLevel=None
	events=None
	noEvents=0
	eventProbability=60
	eventDistance=10
	eventSize=1

	def __init__(self):
		#Fixed parameters
		self.size=(127, 127)
		self.sink=[64, 64]
		self.fusionLevel=[2, 3, 4]
		self.noEvents=2
		#Dynamic (may change for each round)
		self.events=None
		self.fusionPoints=None
	def run(self):
		total_tree=0
		total_cedu=[]
		for l in self.fusionLevel:
			total_cedu.append(0)
		rounds=1000

		for i in range(0, rounds):
			self.generateEvent(self.eventSize)
			total_tree=total_tree+self.runTree()

			if random.randint(0, 100)<self.eventProbability:
				eventHappened=True
			else:
				eventHappened=False

			for i in range(0, len(self.fusionLevel)):
				total_cedu[i]=total_cedu[i]+self.runCEDU(self.fusionLevel[i], eventHappened)

		#Output the average
		print (float(total_tree)/rounds)
		for t in total_cedu:
			print (float(t)/rounds)
	def runTree(self):
		eventNodes=[]
		for e in self.events:
			eventNodes.append(self.findClosestNode(e, self.sink))
		totalCost=self.multipathRoute(eventNodes, self.sink)
		return totalCost
	def runCEDU(self, fusionLevel, eventHappened=False):
		self.calculateFusionPoints(fusionLevel)
		fusion_point=self.findClosestFusionPoint()
		#print ("Fusion Level: "+str(fusionLevel)+" Fusion point:", fusion_point, len(self.fusionPoints))

		eventNodes=[]
		for e in self.events:
			eventNodes.append(self.findClosestNode(e, fusion_point))
		totalCost=self.multipathRoute(eventNodes, fusion_point)
		if eventHappened:
			totalCost=totalCost+self.multipathRoute([fusion_point], self.sink)
		return totalCost
	def calculateFusionPoints(self, fusionLevel):
		if fusionLevel==0:
			return

		self.fusionPoints=[self.sink]
		delta_x=self.sink[0]
		delta_y=self.sink[1]
		for i in range (1, fusionLevel+1):
			delta_x=delta_x/2
			delta_y=delta_y/2

			j=delta_x
			while j<self.size[0]:
				k=delta_y
				while k<self.size[1]:
					self.fusionPoints.append((j, k))
					k=k+delta_y*2
				j=j+delta_x*2
	def generateEvent(self, size=1):
		self.events=[]
		for i in range(0, self.noEvents):
			noGenerated=0
			qualified=False
			while not qualified:
				single_event=[]
				eventPoint=[random.randint(1, self.size[0]), random.randint(1, self.size[1])]
				single_event.append(eventPoint)
				#Generate larger events
				if self.eventSize>1:
					size=self.eventSize-1
					node=eventPoint
					moreNeighbors=True
					neighbors=self.getNeighbors(node)
					while size>0 and moreNeighbors:
						avail_neighbors=[]
						for n in neighbors:
							avail_neighbors.append(n)
						random.shuffle(avail_neighbors)
						if len(avail_neighbors)==0:
							moreNeighbors=False
						else:
							for n in avail_neighbors:
								single_event.append(n)
								size=size-1
								if size==0:
									break
								neighbors=self.getNeighbors(avail_neighbors[random.randint(0, len(avail_neighbors)-1)])
				qualified=self.checkEvent(single_event)
				noGenerated=noGenerated+1

			self.events.append(single_event)
	def checkEvent(self, single_event):
		for e in self.events:
			d = self.getEventDist(single_event, e)
			if self.eventDistance!=0 and d>self.eventDistance:
				return False
		return True
	def getNeighbors(self, node):
		allNeighbors=[]
		if node[1]>0:
			allNeighbors.append([node[0],node[1]-1])
		if node[1]<self.size[1]-1:
			allNeighbors.append([node[0], node[1]+1])
		if node[0]>0:
			allNeighbors.append([node[0]-1,node[1]])
		if node[0]<self.size[0]-1:
			allNeighbors.append([node[0]+1,node[1]])
		return allNeighbors
	def multipathRoute(self, groupNodes, singleNode):
		horizontal_d=0
		horizontal_added=[]
		for node in groupNodes:
			d=node[0]-singleNode[0]

			max_d=None
			for possible_d in horizontal_added:
				if possible_d[0]==node[1] and possible_d[1]*d>0:
					max_d=possible_d
					if math.fabs(max_d[1])<math.fabs(d):
						max_d[1]=d
					break

			if max_d==None:
				max_d=[node[1], d]
				horizontal_added.append(max_d)
		for h in horizontal_added:
			horizontal_d=horizontal_d+math.fabs(h[1])
		#print (horizontal_added, horizontal_d)

		vertical_pd=0
		vertical_nd=0
		for i in range(0, len(groupNodes)):
			if groupNodes[i][1]<singleNode[1] and vertical_nd<singleNode[1]-groupNodes[i][1]:
				vertical_nd=singleNode[1]-groupNodes[i][1]
			elif groupNodes[i][1]>singleNode[1] and vertical_pd<groupNodes[i][1]-singleNode[1]:
				vertical_pd=groupNodes[i][1]-singleNode[1]

		#print (vertical_pd, vertical_nd)
		return horizontal_d+vertical_pd+vertical_nd
	def findClosestFusionPoint(self):
		min_dist=0
		min_node=None
		for s in self.fusionPoints:
			dist=0
			nodes=[]
			for e in self.events:
				nodes.append(self.findClosestNode(e, s))
			dist=self.multipathRoute(nodes, s)
			if min_node==None:
				min_node=s
				min_dist=dist
			if dist<min_dist:
				min_node=s
				min_dist=dist
		return min_node
	def findClosestNode(self, groupNodes, singleNode):
		if len(groupNodes)==0:
			return None

		min_node=groupNodes[0]
		min_dist=self.getDist(groupNodes[0], singleNode)
		for n in groupNodes:
			dist=self.getDist(n, singleNode)
			if dist<min_dist:
				min_node=n
				min_dist=dist
		return min_node
	def getEventDist(self, event1, event2):
		min_dist=self.getDist(event1[0], event2[0])
		for n1 in event1:
			for n2 in event2:
				dist=self.getDist(n1, n2)
				if dist<min_dist:
					min_dist=dist
		return min_dist
	def getDist(self, node1, node2):
		return (node1[0]-node2[0])*(node1[0]-node2[0])+(node1[1]-node2[1])*(node1[1]-node2[1])
if __name__ == "__main__":
	s=Simulator()
	s.generateEvent()
	print (s.events)
	s.run()
