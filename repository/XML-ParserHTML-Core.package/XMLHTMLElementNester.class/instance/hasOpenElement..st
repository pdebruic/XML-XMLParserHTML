testing
hasOpenElement: anElement
	^ (self openElementsByName
		at: anElement
		ifAbsent: [0]) > 0