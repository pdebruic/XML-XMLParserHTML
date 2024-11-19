tests
testHTMLEntities
	| entity character document p |

	entity := 'nbsp'.
	character := XMLHTMLParserTokenizer predefinedHTMLEntities at: entity.
	document :=
		XMLHTMLParser parse:
			'<p>&', entity, ';&', entity, '</p>',
			'<div>&undeclared; &undeclared &;& ;'.

	p := document findElementNamed: 'p'.
	self
		assert: p contentString size = 2;
		assert: (p contentString allSatisfy: [:each | each == character]);
		assert: (document findElementNamed: 'div') contentString = '&undeclared; &undeclared &;& ;'.