tests
testXMLDeclaration
	| document |

	document := XMLHTMLParser parse: '<?xml ?>'.
	self
		assert: document version = 1.0;
		assert: document encoding = '';
		deny: document isStandalone.

	document := XMLHTMLParser parse: '<?xml version="1.1" ?>'.
	self
		assert: document version = 1.1;
		assert: document encoding = '';
		deny: document isStandalone.

	document :=
		XMLHTMLParser parse:
			'<?xml version="onePointZero" encoding="utf-8" standalone="yes"?>'.
	self
		assert: document version = 1.0;
		assert: document encoding = 'utf-8';
		assert: document isStandalone.

	document :=
		XMLHTMLParser parse:
			'<?xml version="1.1" ?>
			<?xml version="1.0" encoding="utf-8" standalone="yes"?>'.
	self
		assert: document version = 1.1;
		assert: document encoding = '';
		deny: document isStandalone;
		assert: document nodes size = 1;
		assert: document firstNode isPI;
		assert: document firstNode target = 'xml';
		assert: document firstNode data = 'version="1.0" encoding="utf-8" standalone="yes"'.