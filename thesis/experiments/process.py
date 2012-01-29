import re

class DataProcessor:
	results=None
	currentRef=0
	def __init__(self):
		self.results={}
		self.currentRef=0
	def process(self, filename):
		f=open(filename, 'r')
		for str in f:
			m=re.compile('([0-9]+): ([0-9]+): ([0-9]+): ([0-9]+)').search(str)
			if m!=None:
				nodeID=int(m.group(1))
				seq=int(m.group(3))
				timestamp=int(m.group(4))
				timeDiff=0
				if nodeID==0:
					self.currentRef=timestamp
				elif self.currentRef!=0:
					timeDiff=timestamp-self.currentRef
					#Save it in the results
					if not nodeID in self.results:
						self.results[nodeID]=[timeDiff, 1]
					else:
						self.results[nodeID][0]+=timeDiff
						self.results[nodeID][1]+=1
		f.close()

		#Print the final results
		for k,v in self.results.items():
			print (k, ':', v[0]/v[1])
					

if __name__ == "__main__":
	processor=DataProcessor()
	processor.process('sample.log')
