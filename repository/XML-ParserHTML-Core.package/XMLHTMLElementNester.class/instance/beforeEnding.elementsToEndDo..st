nesting
beforeEnding: anElement elementsToEndDo: anElementEndingBlock
	self openElementsReverseDo: [:each |
		each = anElement
			ifTrue: [^ self].
		anElementEndingBlock value: each].