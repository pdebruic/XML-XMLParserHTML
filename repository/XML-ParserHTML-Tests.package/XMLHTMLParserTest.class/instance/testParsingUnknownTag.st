tests
testParsingUnknownTag
	| document |

	self
		shouldnt: [document := XMLHTMLParser parse: '<pharo>test</pharo>']
		raise: Error.

	self
		assert: document printString = '<html><body><pharo>test</pharo></body></html>';
		assert: document contentString = 'test'.