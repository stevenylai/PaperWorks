from networkx import *
import random
import math

class WSNGenerator:
	graph=None
	sink=None
	fusionPoints=None
	def __init__(self):
		self.sink=None
		self.graph=None
		self.fusionPoints=[]
	def readWSN(self, V, E):
		self.graph=Graph()
		for i in range(0, len(V)):
			self.graph.add_nodes_from([i+1], coordinate=(V[i][0], V[i][1]), probability=V[i][2])
		self.graph.add_edges_from(E)
	def generateFusionPoints(self, totalFusionPoints):
		if self.graph==None:
			return

		if totalFusionPoints>=self.graph.number_of_nodes():
			return
		
		allFusionPoints=[]
		v_sortByDegree=sorted(self.graph.nodes(), key=lambda node:self.graph.degree(node), reverse=True)
		for i in range(0, totalFusionPoints):
			allFusionPoints.append(v_sortByDegree[i+1])
		print ("Fusion Point(s):", allFusionPoints, "Out of:", v_sortByDegree)
		self.fusionPoints=allFusionPoints
	def generateWSN(self, size, totalVertices, minDegree):
		self.graph=Graph()

		verticesList=[]
		for i in range(0, totalVertices):
			x=random.randint(0, size[0])
			y=random.randint(0, size[1])
			while verticesList.count((x, y))>0:
				x=random.randint(0, size[0])
				y=random.randint(0, size[1])
			verticesList.append((x,y))
			self.graph.add_node(i+1, coordinate=(x, y), probability=0)
			for n in self.graph.nodes(data=True):
				if n[0]!=i+1:
					self.graph.add_edge(n[0], i+1, weight=math.sqrt((n[1]["coordinate"][0]-x)*(n[1]["coordinate"][0]-x)+(n[1]["coordinate"][1]-y)*(n[1]["coordinate"][1]-y)))


		v_sortByDegree=sorted(self.graph.nodes(), key=lambda node:self.graph.degree(node))
		e_sortByWeight=sorted(self.graph.edges(data=True), key=lambda edge:edge[2]["weight"], reverse=True)
		deletedEdges=[]

		while self.graph.degree(v_sortByDegree[0])>=minDegree and is_connected(self.graph):
			if len(deletedEdges)>0 and e_sortByWeight[0][2]["weight"]!=deletedEdges[0][2]["weight"]:
				deletedEdges=[]

			deletedEdges.append(e_sortByWeight[0])
			self.graph.remove_edge(e_sortByWeight[0][0], e_sortByWeight[0][1])
			v_sortByDegree=sorted(self.graph.nodes(), key=lambda node:self.graph.degree(node))
			e_sortByWeight=sorted(self.graph.edges(data=True), key=lambda edge:edge[2]["weight"], reverse=True)

		if self.graph.degree(v_sortByDegree[0])<minDegree or not is_connected(self.graph):
			self.graph.add_edges_from(deletedEdges)

		v_sortByDegree=sorted(self.graph.nodes(), key=lambda node:self.graph.degree(node))
		self.sink=v_sortByDegree[len(v_sortByDegree)-1]
		print ("sink:", self.sink, "Out of:", v_sortByDegree)
		#print (v_sortByDegree)
		#print (e_sortByWeight)
		#print (self.graph.nodes(data=True))
		#print (self.graph.edges(data=True))
			
if __name__ == "__main__":
	g=WSNGenerator()
	g.generateWSN((20, 20), 20, 5)
