private
elementsToStartBeforeStartTag: anHTMLTagInfo do: anElementStartingBlock
	anHTMLTagInfo isHTMLTag
		ifTrue: [^ self].
	self startedHTMLSection
		ifFalse: [anElementStartingBlock value: 'html'].
	(anHTMLTagInfo isHeadTag
		or: [anHTMLTagInfo isBodyTag])
		ifTrue: [^ self]. 

	(self mustStartHeadSectionForTag: anHTMLTagInfo)
		ifTrue: [anElementStartingBlock value: 'head']
		ifFalse: [
			(self mustStartBodySectionForTag: anHTMLTagInfo)
				ifTrue: [anElementStartingBlock value: 'body']].