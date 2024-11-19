tokenizing
nextQuotedStringValue
	| quote nextChar |

	streamReader atQuote
		ifFalse: [^ self nextElementName].

	quote := streamReader next.
	characterStream reset.
	[(nextChar := streamReader next) == quote
		or: [nextChar == nil]]
		whileFalse: [characterStream nextPut: nextChar].
	^ characterStream contents.