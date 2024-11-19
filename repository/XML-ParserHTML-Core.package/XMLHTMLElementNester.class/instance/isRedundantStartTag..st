testing
isRedundantStartTag: anElement
	anElement = 'html'
		ifTrue: [^ self startedHTMLSection].
	anElement = 'head'
		ifTrue: [^ self startedHeadSection].
	anElement = 'body'
		ifTrue: [^ self startedBodySection].
	^ false.