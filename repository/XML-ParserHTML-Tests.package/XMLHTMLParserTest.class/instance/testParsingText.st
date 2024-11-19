tests
testParsingText
	| document |

	#('text' '<html>text' '<body>text') do: [:source |
		document := XMLHTMLParser parse: source.
		self
			assert: document nodes size = 1;
			assert: (document root isElementNamed: 'html');
			assert: document root nodes size = 1;
			assert: (document root firstNode isElementNamed: 'body');
			assert: (document root firstNode contentString = 'text')].

	#('<head>text' '<html><head>text') do: [:source |
		document := XMLHTMLParser parse: '<head>text'.
		self
			assert: document nodes size = 1;
			assert: (document root isElementNamed: 'html');
			assert: document root nodes size = 2;
			assert: (document root firstNode isElementNamed: 'head');
			assert: (document root nodes second isElementNamed: 'body');
			assert: (document root nodes second contentString = 'text')].