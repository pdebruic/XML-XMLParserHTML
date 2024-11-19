private
elementsToEndBeforeStartTag: anHTMLTagInfo do: anElementEndingBlock
	| excludingTag |

	(self mustEndHeadSectionForTag: anHTMLTagInfo)
		ifTrue: [
			^ self
				beforeEnding: 'html'
				elementsToEndDo: anElementEndingBlock].

	(((self hasOpenElement: anHTMLTagInfo name)
		and: [self cannotSelfNestTag: anHTMLTagInfo])
		or: [(excludingTag := anHTMLTagInfo mutuallyExcludingTag) notNil
			and: [self hasOpenElement: excludingTag]])
		ifTrue: [
			self openElementsReverseDo: [:each |
				anElementEndingBlock value: each.
				((each = anHTMLTagInfo name)
					or: [each = excludingTag])
					ifTrue: [^ self]]].