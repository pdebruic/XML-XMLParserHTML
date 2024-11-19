nesting
startElement: anElement
	| association |

	association :=
		self openElementsByName
			associationAt: anElement
			ifAbsent: [self openElementsByName add: (anElement -> 0)].
	association value: association value + 1.

	self startedHTMLSection
		ifTrue: [
			self startedBodySection
				ifFalse: [
					(self startedHeadSection not
						and: [anElement = 'head']) 
						ifTrue: [startedHeadSection := true]
						ifFalse: [startedBodySection := anElement = 'body']]]
		ifFalse: [startedHTMLSection := anElement = 'html'].

	super startElement: anElement.