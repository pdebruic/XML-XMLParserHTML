tokenizing - dtd
skipNonDeclarationOrEntity
	[streamReader atEnd
		or: [streamReader peek == $<
			or: [streamReader peek == $%
				or: [state isInternalSubsetState
					and: [streamReader peek == $]]]]]]
		whileFalse: [streamReader next]
	