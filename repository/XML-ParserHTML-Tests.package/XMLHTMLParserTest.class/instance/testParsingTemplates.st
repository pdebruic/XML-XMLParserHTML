tests
testParsingTemplates
	| document |

	document := XMLHTMLParser parse: '<template><b>test</b></template>'.
	self
		assert: document allElements elementNames asArray = #('html' 'head' 'template');
		assert: (document root firstElement isNamed: 'head');
		assert: (document root firstElement contentStringAt: 'template') = '<b>test</b>'.

	document := XMLHTMLParser parse: '<body><template><p>test<p></template></body>'.
	self
		assert: document allElements elementNames asArray = #('html' 'body' 'template');
		assert: (document root firstElement isNamed: 'body');
		assert: (document root firstElement contentStringAt: 'template') = '<p>test<p>'.