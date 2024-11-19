tests
testParsingInvalidPCData
	| document |

	#('< one & two >' '& three < four >') do: [:each |
		document := XMLHTMLParser parse: each.
		self
			assert: document allNodes size = 4;
			assert: (document findElementNamed: 'body') contentString = each].