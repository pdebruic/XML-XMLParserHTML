private
innerXMLRootNode: aRootNode
	aRootNode ancestorNodes reverseDo: [:each |
		self pushNode: each].
	super innerXMLRootNode: aRootNode.