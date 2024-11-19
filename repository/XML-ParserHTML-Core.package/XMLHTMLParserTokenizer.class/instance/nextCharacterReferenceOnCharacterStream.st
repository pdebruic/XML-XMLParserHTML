tokenizing
nextCharacterReferenceOnCharacterStream
	"returns the character written to 'characterStream' or $& if
	it wasn't replaced"
	| character |

	"skip $#"
	streamReader next.
	nameStream reset.
	character :=
		self characterFromCodePoint:
			(self nextCharacterValueLiteralPrintedOn: nameStream).
	(character notNil
		and: [driver replacesContentEntityReferences])
		ifTrue: [
			streamReader peek == $; "; is optional"
				ifTrue: [streamReader next].
			characterStream nextPut: character.
			^ character]
		ifFalse: [
			characterStream
				nextPutAll: '&#';
				nextPutAll: nameStream contents.
			^ $&].