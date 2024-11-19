tokenizing
nextAttributeValue
	| quote nextChar |

	streamReader atQuote
		ifFalse: [^ self nextElementName].
	quote := streamReader next.

	characterStream reset.
	[(nextChar := streamReader next) == quote
		or: [nextChar == nil]]
		whileFalse: [
			nextChar == $&
				ifTrue: [
					self nextGeneralEntityOrCharacterReferenceOnCharacterStream]
				ifFalse: [characterStream nextPut: nextChar]].
	^ characterStream contents.