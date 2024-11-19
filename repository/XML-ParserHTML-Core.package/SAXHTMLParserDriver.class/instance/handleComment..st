handling
handleComment: aString
	self isDeferringEvents
		ifTrue: [
			self
				deferEventSelector: #comment:
				argument: aString]
		ifFalse: [self saxHandler comment: aString]