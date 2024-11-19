tokenizing
nextNonHTMLCodeSectionToken
	| isInComment nextChar commentStartChar |

	characterStream reset.
	isInComment := false.
	[streamReader atEnd
		or: [self atEndTag: nonHTMLElement]]
		whileFalse: [
			isInComment
				ifTrue: [
					nextChar := streamReader next.
					((commentStartChar == $/
						and: [nextChar == streamReader normalizedLineEndingChar])
							or: [commentStartChar == $*
								and: [nextChar == $*
									and: [streamReader peek == $/]]])
						ifTrue: [
							commentStartChar == $*
								ifTrue: [
									characterStream nextPut: $*.
									nextChar := streamReader next].
							isInComment := false].
					characterStream nextPut: nextChar]
				ifFalse: [
					streamReader atQuote
						ifTrue: [self nextQuotedStringOnCharacterStream]
						ifFalse: [
							(((nextChar := streamReader next) == $/)
								and: [streamReader peek == $*
									or: [streamReader peek == $/]])
								ifTrue: [
									isInComment := true.
									characterStream
										nextPut: $/;
										nextPut: (commentStartChar := streamReader next)]
								ifFalse: [characterStream nextPut: nextChar]]]].
	state := state contentState.

	driver handlePCData: characterStream contents.