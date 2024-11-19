handling
handleEndDocument
	self hasDeferredEvents
		ifTrue: [self processDeferredEvents].
	self saxHandler endDocument.