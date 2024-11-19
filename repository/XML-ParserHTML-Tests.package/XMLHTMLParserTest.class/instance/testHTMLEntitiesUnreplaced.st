tests
testHTMLEntitiesUnreplaced
	| entity character document |

	entity := 'nbsp'.
	character := XMLHTMLParserTokenizer predefinedHTMLEntities at: entity.
	document :=
		(XMLHTMLParser on:
			'<p>&', entity, ';&', entity, '</p>',
			'<div>&undeclared; &undeclared &;& ;')
			replacesContentEntityReferences: false;
			parseDocument.
	self
		assert: (document findElementNamed: 'p') contentString = '&nbsp;&nbsp';
		assert: (document findElementNamed: 'div') contentString = '&undeclared; &undeclared &;& ;'.