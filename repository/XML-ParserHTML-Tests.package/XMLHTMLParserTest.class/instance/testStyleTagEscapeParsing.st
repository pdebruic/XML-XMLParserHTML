tests
testStyleTagEscapeParsing
	#(
		#('<style>"one\"</style>"two</style>' '"one\"</style>"two')
		#('<style>"\one\"</style>"two</style>' '"\one\"</style>"two')
		#('<style>"one\\"two</style>' '"one\\"two')
		#('<style>"one\\\"</style>"two</style>' '"one\\\"</style>"two')
		#('<style>''one\''</style>''two</style>' '''one\''</style>''two')
		#('<style>''one\\''two</style>' '''one\\''two')
		#('<style>''one\\\''</style>''two</style>' '''one\\\''</style>''two')
	) do: [:each | | body source contentString |
		source := each first.
		contentString := each second.
		body := (XMLHTMLParser parse: source) findElementNamed: 'body'.
		self
			assert: body nodes size = 1;
			assert: (body firstNode isNamed: 'style');
			assert: body firstNode contentString = contentString]