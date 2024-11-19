tests
testIsInContent
	| html handler parser |

	html := '<?xml version="1.0"?>
			<!--comment-->
			<?target data?>
			<!DOCTYPE root [<!ELEMENT root EMPTY>]>
			<!--comment-->
			<?target data?>
			<root/>'.
	handler := SAXHTMLHandler on: html.
	parser := handler parser.
	9 timesRepeat: [
		parser parseToken.
		self deny: handler isInContent].
	parser parseToken.
	self assert: handler isInContent.

	handler := SAXHTMLHandler on: 'test'.
	parser := handler parser.
	parser parseToken.
	self deny: handler isInContent.
	parser parseToken.
	self assert: handler isInContent.