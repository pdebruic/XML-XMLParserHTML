handling
handleWhitespace: aString
	self isDeferringEvents
		ifTrue: [
			self
				deferEventSelector: #characters:
				argument: aString]
		ifFalse: [self saxHandler characters: aString]