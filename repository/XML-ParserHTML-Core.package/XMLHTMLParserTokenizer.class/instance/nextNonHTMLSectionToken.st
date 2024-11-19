tokenizing
nextNonHTMLSectionToken
	characterStream reset.
	[streamReader atEnd
		or: [self atEndTag: nonHTMLElement]]
		whileFalse: [| nextChar |
			(nextChar := streamReader next) == $&
				ifTrue: [self nextGeneralEntityOrCharacterReferenceOnCharacterStream]
				ifFalse: [characterStream nextPut: nextChar]].
	state := state contentState.

	driver handlePCData: characterStream contents.