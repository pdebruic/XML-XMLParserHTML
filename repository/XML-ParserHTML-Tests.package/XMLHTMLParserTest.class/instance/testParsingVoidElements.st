tests
testParsingVoidElements
	| document body |

	document :=
		XMLHTMLParser parse:
			'<body>one<img src="a.jpg">two</img><body>three<img src="b.jpg"/>'.
	body := document findElementNamed: 'body'.
	self
		assert: body nodes size = 4;
		assert: (body nodes first isStringNode: 'one');
		assert: (body nodes second isElementNamed: 'img');
		assert: (body nodes second attributeAt: 'src') = 'a.jpg';
		assert: (body nodes third isStringNode: 'twothree');
		assert: (body nodes fourth isElementNamed: 'img');
		assert: (body nodes fourth attributeAt: 'src') = 'b.jpg'.