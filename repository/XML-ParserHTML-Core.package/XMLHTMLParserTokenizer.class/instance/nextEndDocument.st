tokenizing
nextEndDocument
	(state isContentState
		and: [elementNester hasOpenElements])
		ifTrue: [
			elementNester openElementsReverseDo: [:each |
				driver handleEndTag: each]].
	super nextEndDocument.