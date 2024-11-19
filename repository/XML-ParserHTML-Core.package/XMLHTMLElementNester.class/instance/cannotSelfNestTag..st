private
cannotSelfNestTag: anHTMLTagInfo
	anHTMLTagInfo isNonNestable
		ifTrue: [	| tagGroup |
			"tags like <td> can nest in each other if there is a <table> between
			them like <td><table><tr><td>...."
			((tagGroup := anHTMLTagInfo nestableTagGroup)
				anySatisfy: [:each | self hasOpenElement: each])
				ifFalse: [^ true].

			self openElementsReverseDo: [:each |
				each = anHTMLTagInfo name
					ifTrue: [^ true].
				(tagGroup includes: each)
					ifTrue: [^ false]]].
	^ false.