tokenizing
nextElementName
	| nextChar |

	nameStream reset.
	 [(nextChar := streamReader peek) == nil
		or: [(HTMLNameDelimiters includes: nextChar)
			or: [
				(state isDoctypeDeclarationState
					and: [nextChar == $[])
					or: [state isInternalSubsetState
						and: [nextChar == $]]]]]]
		whileFalse: [nameStream nextPut: streamReader next].
	^ nameStream contents.