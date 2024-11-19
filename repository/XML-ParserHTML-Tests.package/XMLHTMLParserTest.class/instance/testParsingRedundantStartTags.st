tests
testParsingRedundantStartTags
	| document html head body |

	document :=
		XMLHTMLParser parse:
			'<html>
				<head><html>
					<title>test</title><head>
					<script>test()</script><head/>
				</head><html/>
				<body>one<body>two<body/>three</body><!--ignored-->
			</html>'.
	self
		assert: document nodes size = 1;
		assert: (document firstNode isElementNamed: 'html').

	html := document firstNode.
	self
		assert: html nodes size = 5;
		assert: html nodes first isStringNode;
		assert: html nodes first isWhitespace;
		assert: (html nodes second isElementNamed: 'head');
		assert: html nodes third isStringNode;
		assert: html nodes third isWhitespace;
		assert: (html nodes fourth isElementNamed: 'body');
		assert: html nodes fifth isStringNode;
		assert: html nodes fifth isWhitespace.

	head := html nodes second.
	self
		assert: head nodes size = 5;
		assert: head nodes first isStringNode;
		assert: head nodes first isWhitespace;
		assert: (head nodes second isElementNamed: 'title');
		assert: head nodes second contentString = 'test';
		assert: head nodes third isStringNode;
		assert: head nodes third isWhitespace;
		assert: (head nodes fourth isElementNamed: 'script');
		assert: head nodes fourth contentString = 'test()';
		assert: head nodes fifth isStringNode;
		assert: head nodes fifth isWhitespace.

	body := html nodes fourth.
	self
		assert: body nodes size = 1;
		assert: body firstNode contentString = 'onetwothree'.