tests
testParsingCDATA
	#('<![CDATA[not ignored]]>'
		'<body><![CDATA[not ignored]]></body>'
		'<!DOCTYPE><![CDATA[not ignored]]><html><body/>')
		do: [:each | | document |
			document := XMLHTMLParser parse: each.
			self assert: document contentString = 'not ignored'].