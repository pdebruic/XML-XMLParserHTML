tokenizing
nextPrologToken
	streamReader skipSeparators.
	streamReader atEnd
		ifTrue: [^ self].
	streamReader peek == $<
		ifTrue: [
			streamReader next.
			streamReader peek == $?
				ifTrue: [^ self nextPI].
			^ self nextNonPIPrologOrContentMarkupToken].
	self
		nextStartContent;
		nextContentToken.