tokenizing
nextXMLAttributeValue
	| quote nextChar |

	streamReader atQuote
		ifFalse: [^ self nextElementName].

	quote := streamReader next.
	xmlDeclarationStream reset.
	[(nextChar := streamReader next) == quote
		or: [nextChar == nil]]
		whileFalse: [xmlDeclarationStream nextPut: nextChar].
	^ xmlDeclarationStream contents.