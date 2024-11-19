tokenizing
nextTag
	| tagName attributes attributeName nextChar |

	streamReader peek == $/
		ifTrue: [^ self nextEndTag].
	tagName := self nextElementName asLowercase.

	[streamReader skipSeparators.
	((nextChar := streamReader peek) == $>
		or: [nextChar == $/
			or: [nextChar == nil
				or: [(attributeName := self nextElementName asLowercase) size = 0]]])]
		whileFalse: [
			streamReader skipSeparators.
			(streamReader peek == $=)
				ifTrue: [streamReader next].
			streamReader skipSeparators.
			(attributes
				ifNil: [attributes := driver newAttributeDictionary])
				at: attributeName
				put: self nextAttributeValue].
	(elementNester isRedundantStartTag: tagName)
		ifTrue: [
			nextChar == $/
				ifTrue: [streamReader next].
			^ self nextMarkupTerminator].
	attributes
		ifNil: [attributes := driver newEmptyAttributeDictionary]
		ifNotNil: [
			tagName = 'meta'
				ifTrue: [self processMetaAttributes: attributes]].

	elementNester
		beforeStarting: tagName
		elementsToEndDo: [:each | self endElement: each]
		elementsToStartDo: [:each | self startElement: each].
	self
		startElement: tagName
		attributes: attributes.

	nextChar == $/
		ifTrue: [
			streamReader next.
			self endElement: tagName]
		ifFalse: [
			(elementNester isVoidElement: tagName)
				ifTrue: [self endElement: tagName]
				ifFalse: [
					(NonHTMLSectionTags includes: tagName)
						ifTrue: [self nextStartNonHTMLElement: tagName]]].
	self nextMarkupTerminator.