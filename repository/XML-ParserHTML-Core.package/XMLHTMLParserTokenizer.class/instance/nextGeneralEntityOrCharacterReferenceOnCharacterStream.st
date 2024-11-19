tokenizing
nextGeneralEntityOrCharacterReferenceOnCharacterStream
	"returns the character written to 'characterStream' if any, nil otherwise"
	streamReader peek == $#
		ifTrue: [^ self nextCharacterReferenceOnCharacterStream]
		ifFalse: [
			"use #isXMLWhitespace instead of the narrower, XML-specific
			#isXMLSeparator, and since nil understands #isXMLWhitespace
			no nil test is needed"
			streamReader peek isXMLWhitespace
				ifTrue: [
					characterStream nextPut: $&.
					^ $&].
			^ self nextGeneralEntityReferenceOnCharacterStream]