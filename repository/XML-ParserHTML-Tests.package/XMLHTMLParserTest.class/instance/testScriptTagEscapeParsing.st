tests
testScriptTagEscapeParsing
	#(
		#('<script>"one\"</script>"two</script>' '"one\"</script>"two')
		#('<script>"\one\"</script>"two</script>' '"\one\"</script>"two')
		#('<script>"one\\"two</script>' '"one\\"two')
		#('<script>"one\\\"</script>"two</script>' '"one\\\"</script>"two')
		#('<script>''one\''</script>''two</script>' '''one\''</script>''two')
		#('<script>''one\\''two</script>' '''one\\''two')
		#('<script>''one\\\''</script>''two</script>' '''one\\\''</script>''two')
	) do: [:each | | body source contentString |
		source := each first.
		contentString := each second.
		body := (XMLHTMLParser parse: source) findElementNamed: 'body'.
		self
			assert: body nodes size = 1;
			assert: (body firstNode isNamed: 'script');
			assert: body firstNode contentString = contentString]