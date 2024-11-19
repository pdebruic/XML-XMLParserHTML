nesting
beforePCDataElementsToEndDo: anElementEndingBlock elementsToStartDo: anElementStartingBlock
	(self startedHeadSection
		and: [self startedBodySection not])
		ifTrue: [
			self
				beforeEnding: 'html'
				elementsToEndDo: anElementEndingBlock].
	self startedHTMLSection
		ifFalse: [anElementStartingBlock value: 'html'].
	self startedBodySection
		ifFalse: [anElementStartingBlock value: 'body'].