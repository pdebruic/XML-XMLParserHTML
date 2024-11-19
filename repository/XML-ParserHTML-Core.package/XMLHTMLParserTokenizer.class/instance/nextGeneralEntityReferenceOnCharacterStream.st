tokenizing
nextGeneralEntityReferenceOnCharacterStream
	"returns the (first) character written to 'characterStream' if any,
	nil otherwise"
	| name |

	name := self nextElementName.
	driver replacesContentEntityReferences
		ifTrue: [
			PredefinedHTMLEntities
				at: name
				ifPresent: [:character |
					streamReader peek == $; "; is optional"
						ifTrue: [streamReader next].
					characterStream nextPut: character.
					^ character]].
	characterStream
		nextPut: $&;
		nextPutAll: name.
	^ $&.