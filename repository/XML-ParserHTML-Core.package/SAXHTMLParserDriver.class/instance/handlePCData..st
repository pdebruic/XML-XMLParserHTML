handling
handlePCData: aString
	self isDeferringEvents
		ifTrue: [self processNonTerminatingDeferredEvents].
	self saxHandler characters: aString.