tokenizing
nextCDataSection
	| closingBracketsRead nextChar |

	self expectNextAll: '[CDATA['.
	characterStream reset.
	closingBracketsRead := 0.
	[(nextChar := streamReader next) == nil
		or: [closingBracketsRead = 2
			and: [nextChar == $>]]]
		whileFalse: [
			nextChar == $]
				ifTrue: [
					closingBracketsRead = 2
						ifTrue: [characterStream nextPut: $]]
						ifFalse: [closingBracketsRead := closingBracketsRead + 1]]
				ifFalse: [
					closingBracketsRead > 0
						ifTrue: [
							1 to: closingBracketsRead do: [:i |
								characterStream nextPut: $]].
							closingBracketsRead := 0].
					characterStream nextPut: nextChar]].
	driver handleCData: characterStream contents.