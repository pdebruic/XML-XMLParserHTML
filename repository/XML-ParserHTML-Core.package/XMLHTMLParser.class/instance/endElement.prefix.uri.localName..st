handling - content
endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName
	self topNode
		ifNotNil: [:node |
			(node isElement
				and: [node name = aQualifiedName])
				ifTrue: [self popNode]].