from networkx import *
import random
from WSNCreator import *

class EventGenerator:
	graph=None
	sink=None
	fusionPoints=None
	def __init__(self, graph, sink, fusionPoints):
		self.graph=graph
		self.sink=sink
		self.fusionPoints=fusionPoints
	def randomGenerateProbability(self, targetValue):
		i=0
		for n in self.graph.nodes(data=True):
			#if i==0 or i==1:
			n[1]["probability"]=targetValue
			i=i+1
	def generate(self):
		toHappen=[]
		for n in self.graph.nodes(data=True):
			if random.randint(1, 100)<=n[1]["probability"]:
				toHappen.append(n)
		#print (toHappen)
		return toHappen
class EventDetector:
	eventGenerator=None
	eventSources=None
	def __init__(self, eventGenerator):
		self.eventGenerator=eventGenerator
	def execute(self):
		rounds=10000
		costSPT=costCEDU=0.0
		delaySPT=delayCEDU=0.0
		for i in range(0, rounds):
			self.eventSources = self.eventGenerator.generate()
			costSPT=costSPT+self.SPTDetectionCost()
			costCEDU=costCEDU+self.CEDUDetectionCost()
			delaySPT=delaySPT+self.SPTDetectionDelay()
			delayCEDU=delayCEDU+self.CEDUDetectionDelay()
		print ("SPT:", costSPT/rounds, "CEDU:", costCEDU/rounds)
		#print ("SPT:", delaySPT/rounds, "CEDU:", delayCEDU/rounds)
	def SPTDetectionDelay(self):
		allPathLen=[]
		for e in self.eventSources:
			pathLen = shortest_path_length(self.eventGenerator.graph, source=e[0], target=self.eventGenerator.sink, weighted=False)
			allPathLen.append(pathLen)
		allPathLen.sort(reverse=True)
		if len(allPathLen)>0:
			return allPathLen[0]
		else:
			return 5
	def SPTDetectionCost(self):
		totalCost=0
		for e in self.eventSources:
			pathLen = shortest_path_length(self.eventGenerator.graph, source=e[0], target=self.eventGenerator.sink, weighted=False)
			totalCost=totalCost+pathLen
		return totalCost
	def CEDUDetectionDelay(self):
		allCost=[]
		for f in self.eventGenerator.fusionPoints:
			allCost.append(0)

		for i in range(0, len(allCost)):
			for e in self.eventSources:
				pathLen = shortest_path_length(self.eventGenerator.graph, source=e[0], target=self.eventGenerator.fusionPoints[i], weighted=False)
				
				allCost[i]=allCost[i]+pathLen
		allCost.sort()
		if len(self.eventSources)==2:
			return allCost[0]+0.01
		else:
			return allCost[0]
	def CEDUDetectionCost(self):
		allCost=[]
		for f in self.eventGenerator.fusionPoints:
			allCost.append(0)

		for i in range(0, len(allCost)):
			for e in self.eventSources:
				pathLen = shortest_path_length(self.eventGenerator.graph, source=e[0], target=self.eventGenerator.fusionPoints[i], weighted=False)
				
				allCost[i]=allCost[i]+pathLen
		allCost.sort()
		return allCost[0]

class SimMain:
	g_creator=None
	e_generator=None
	e_detector=None
	def __init__(self, region, numOfNodes, minDegree, numOfFP, probability):
		self.g_creator = WSNGenerator()
		self.g_creator.generateWSN(region, numOfNodes, minDegree)
		self.g_creator.generateFusionPoints(numOfFP)

		self.e_generator = EventGenerator(self.g_creator.graph, self.g_creator.sink, self.g_creator.fusionPoints)
		self.e_generator.randomGenerateProbability(probability)

		self.e_detector = EventDetector(self.e_generator)
	def runSim(self):
		self.e_detector.execute()
if __name__ == "__main__":
	sim = SimMain((50, 50), 20, 4, 2, 30)
	sim.runSim()

