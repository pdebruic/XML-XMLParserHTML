tokenizing
nextEndTag
	| tagName |

	"Skip /"
	streamReader next.
	tagName := self nextElementName asLowercase.
	streamReader skipSeparators.
	self nextMarkupTerminator.

	(elementNester isRedundantEndTag: tagName)
		ifTrue: [^ self].
	(elementNester hasOpenElement: tagName)
		ifFalse: [self startElement: tagName].
	elementNester
		beforeEnding: tagName
		elementsToEndDo: [:each | self endElement: each].

	self endElement: tagName.