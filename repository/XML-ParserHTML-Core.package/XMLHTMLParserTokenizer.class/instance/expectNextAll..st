tokenizing - expecting
expectNextAll: aString
	aString do: [:each |
		"use #= for pre-SpurVM compatibility where wide chars aren't #=="
		streamReader peek = each
			ifTrue: [streamReader next]
			ifFalse: [
				self nextElementName.
				^ aString]].
	^ aString.