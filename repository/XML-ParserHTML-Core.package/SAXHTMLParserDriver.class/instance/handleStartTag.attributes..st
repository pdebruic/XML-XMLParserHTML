handling
handleStartTag: anElement attributes: anAttributeDictionary
	| prefix localName |

	prefix := anElement xmlPrefixBeforeLocalName.
	localName := anElement xmlLocalNameAfterPrefix: prefix.
	self isDeferringEvents
		ifTrue: [self processNonTerminatingDeferredEvents].
	self saxHandler 
		startElement: anElement
		prefix: prefix
		uri: ''
		localName: localName
		attributes: anAttributeDictionary.