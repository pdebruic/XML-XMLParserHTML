tests
testAttributes
	| document element |

	document :=
		XMLHTMLParser parse:
			'<test one="quoted" two=''subQuoted'' three=unquoted four'.
	element := document findElementNamed: 'test'.
	self
		assert: (element attributeAt: 'one') = 'quoted';
		assert: (element attributeAt: 'two') = 'subQuoted';
		assert: (element attributeAt: 'three') = 'unquoted';
		assert: (element attributeAt: 'four') = ''.