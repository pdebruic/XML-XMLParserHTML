tokenizing
nextPCDataToken
	| isWhitespace nextChar |

	isWhitespace := true.
	characterStream reset.
	[(nextChar := streamReader peek) == $<
		or: [nextChar == nil]]
		whileFalse: [
			streamReader next == $&
				ifTrue: [
					self nextGeneralEntityOrCharacterReferenceOnCharacterStream
						ifNotNil: [:writtenChar |
							isWhitespace
								ifTrue: [
									"use #isXMLWhitespace instead of the
									narrower, XML-specific #isXMLSeparator"
									isWhitespace := writtenChar isXMLWhitespace]]]
				ifFalse: [
					isWhitespace
						ifTrue: [isWhitespace := nextChar isXMLWhitespace].
					characterStream nextPut: nextChar]].
	isWhitespace
		ifTrue: [
			(elementNester isInElement
				and: [characterStream position > 0])
				ifTrue: [driver handleWhitespace: characterStream contents]]
		ifFalse: [
			elementNester
				beforePCDataElementsToEndDo: [:each | self endElement: each]
				elementsToStartDo: [:each | self startElement: each].
			driver handlePCData: characterStream contents].