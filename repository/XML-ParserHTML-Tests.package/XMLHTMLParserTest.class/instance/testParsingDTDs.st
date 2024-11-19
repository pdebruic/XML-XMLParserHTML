tests
testParsingDTDs
	| xml document |

	xml :=
		'<!DOCTYPE root PUBLIC "pubid""external.dtd" [
			<!ELEMENT root ( #PCDATA | one | two)* >
			<!ATTLIST root
						%entity;
						name CDATA #IMPLIED
						number ( %one; | two | three ) "three">
			<!ENTITY general "replacement">
			<!ENTITY externalGeneral PUBLIC "pubid2" "external1.dtd">
			<!ENTITY % parameter "<!ENTITY generalTwo &#32replacement&#32>">
			%parameter;
			<!ENTITY % externalParameter SYSTEM "external2.dtd">
			<!NOTATION notation SYSTEM "note.doc">]>
		<p>&generalTwo;</p>'.
	self
		shouldnt: [document := XMLHTMLParser parse: xml]
		raise: XMLParserException.
	self
		assert: document nodes size = 1;
		assert: (document findElementNamed: 'p') contentString = '&generalTwo;'.
	self assert:
		document printString =
			(XMLHTMLParser parse:
				'<!DOCTYPE root PUBLIC "pubid" "external.dtd"><p>&generalTwo;</p>') printString.