benchmarking
benchmark2
	"
	self new benchmark2
	"
	Smalltalk garbageCollect.
	^ [4000 timesRepeat: [XMLHTMLParser parse: XMLParserTest addressBookXML]] timeToRun