tests
testParseHTML
	| html |

	html := '<html><body>test</body></html>'.
	self
		assert: html parseHTML printString = html;
		assert: html readStream parseHTML printString = html.