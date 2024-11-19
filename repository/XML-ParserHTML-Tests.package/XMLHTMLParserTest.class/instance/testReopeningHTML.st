tests
testReopeningHTML
	| document html body |

	document := XMLHTMLParser parse: '<html><B>one</body></html><I>two'.
	self
		assert: document nodes size = 1;
		assert: (document firstNode isElementNamed: 'html').

	html := document root.
	self
		assert: html nodes size = 1;
		assert: (html firstNode isElementNamed: 'body').

	body := html firstNode.
	self
		assert: body nodes size = 2;
		assert: (body nodes first isElementNamed: 'b');
		assert: body nodes first nodes size = 1;
		assert: (body nodes first firstNode isStringNode: 'one');
		assert: (body nodes second isElementNamed: 'i');
		assert: body nodes second contentString = 'two'.

	document := XMLHTMLParser parse: '<html><B>bold</body></html> '.
	self
		assert: document nodes size = 1;
		assert: (document firstNode isElementNamed: 'html').

	html := document root.
	self
		assert: html nodes size = 1;
		assert: (html firstNode isElementNamed: 'body').

	body := html firstNode.
	self
		assert: body nodes size = 1;
		assert: (body nodes first isElementNamed: 'b');
		assert: body nodes first nodes size = 1;
		assert: (body nodes first firstNode isStringNode: 'bold').