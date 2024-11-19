handling
handleEndTag: anElement
	| prefix localName |

	prefix := anElement xmlPrefixBeforeLocalName.
	localName := anElement xmlLocalNameAfterPrefix: prefix.	
	(self isDeferringEvents
		or: [anElement = 'body'])
		ifTrue: [
			isDeferringEvents := true.
			self
				deferEventSelector: #endElement:prefix:uri:localName:
				arguments:
					(Array
						with: anElement
						with: prefix
						with: ''
						with: localName)]
		ifFalse: [
			self saxHandler
				endElement: anElement
				prefix: prefix
				uri: ''
				localName: localName].