benchmarking
benchmark1
	"
	self new benchmark1
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [SAXHTMLHandler parse: XMLParserTest addressBookXML]] timeToRun