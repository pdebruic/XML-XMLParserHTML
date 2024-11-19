tests
testInnerXMLElement
	| document addressBook person personStartTag |

	document := XMLHTMLParser parse: self addressBookXML.
	addressBook := document findElementNamed: 'addressbook'.
	person := addressBook firstElement.
	personStartTag := person printString copyUpTo: $>.
	addressBook removeNode: person.
	person innerXML: '<p>new</p>'.
	self
		assert: person innerXML = '<p>new</p>';
		assert: person printString = (personStartTag, '><p>new</p></person>').