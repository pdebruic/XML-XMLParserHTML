tests
testParsingXML
	self
		shouldnt: [
			SAXHTMLHandler
				parse: self addressBookXML;
				parse: self addressBookXMLWithDTD;
				parse: self addressBookNamespacedXML;
				parse: self addressBookNamespacePrefixedXML]
		raise: XMLParserException