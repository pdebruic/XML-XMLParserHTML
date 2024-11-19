tokenizing - expecting
expectNext: aCharacter
	"use #= for pre-SpurVM compatibility where wide chars aren't #=="
	streamReader peek = aCharacter
		ifTrue: [streamReader next].
	^ aCharacter.