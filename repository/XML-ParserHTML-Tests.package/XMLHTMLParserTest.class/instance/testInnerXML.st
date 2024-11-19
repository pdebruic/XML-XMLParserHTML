tests
testInnerXML
	| document addressBook |

	document := XMLHTMLParser parse: self addressBookXML.
	addressBook := document findElementNamed: 'addressbook'.
	addressBook firstElement innerXML: 'first'.
	self assert: addressBook firstElement innerXML = 'first'.
	addressBook elements second innerXML: '<second>second</second>'.
	self assert: addressBook elements second innerXML = '<second>second</second>'.
	addressBook elements third innerXML: '<!--third-->'.
	self assert: addressBook elements third innerXML = ''.
	addressBook lastElement innerXML: '<![CDATA[not ignored]]>'.
	self assert: addressBook lastElement innerXML = 'not ignored'.
	self
		assert: addressBook elements size = 4;
		assert: (addressBook elements allSatisfy: [:each | each isElementNamed: 'person']).