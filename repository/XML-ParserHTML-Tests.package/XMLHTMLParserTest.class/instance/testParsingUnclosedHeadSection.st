tests
testParsingUnclosedHeadSection
	#('<head><p>text<Title>title' '<head><body><p>text<Title>title') do: [:each | | document p |
		document := XMLHTMLParser parse: each.
		self
			assert: (document root isElementNamed: 'html');
			assert: document root nodes size = 2;
			deny: (document findElementNamed: 'head') hasChildren;
			assert: (document findElementNamed: 'body') nodes size = 1.
		p := (document findElementNamed: 'body') firstElement.
		self
			assert: (p isNamed: 'p');
			assert: p nodes size = 2;
			assert: (p firstNode isStringNode: 'text');
			assert: (p nodes second isElementNamed: 'title');
			assert: p nodes second contentString = 'title']