nesting
beforeStarting: anElement elementsToEndDo: anElementEndingBlock elementsToStartDo: anElementStartingBlock
	| htmlTagInfo |

	htmlTagInfo :=
		HTMLTagInformation
			at: anElement
			ifAbsent: [XMLHTMLTagInformation named: anElement].
			
	self hasOpenElements
		ifTrue: [
			self
				elementsToEndBeforeStartTag: htmlTagInfo
				do: anElementEndingBlock].
	self
		elementsToStartBeforeStartTag: htmlTagInfo
		do: anElementStartingBlock.