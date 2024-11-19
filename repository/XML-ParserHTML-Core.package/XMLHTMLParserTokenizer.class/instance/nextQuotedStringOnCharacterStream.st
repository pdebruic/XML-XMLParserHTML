tokenizing
nextQuotedStringOnCharacterStream
	| isEscaped quote nextChar |

	isEscaped := false.
	quote := streamReader next.
	characterStream nextPut: quote.
	[streamReader atEnd
		or: [(nextChar := streamReader peek) == quote
			and: [isEscaped not]]]
		whileFalse: [
			isEscaped :=
				nextChar == $\
					and: [isEscaped not].
			characterStream nextPut: streamReader next].
	streamReader next.
	characterStream nextPut: quote.