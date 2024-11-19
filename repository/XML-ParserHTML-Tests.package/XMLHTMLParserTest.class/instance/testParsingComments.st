tests
testParsingComments
	| document |

	document :=
		(XMLHTMLParser on: '<body><!--comment can have -- before end --></body>')
			preservesCommentNodes: true;
			parseDocument.
	self
		assert: (document findElementNamed: 'body') firstNode isComment;
		assert: (document findElementNamed: 'body') firstNode string = 'comment can have -- before end '