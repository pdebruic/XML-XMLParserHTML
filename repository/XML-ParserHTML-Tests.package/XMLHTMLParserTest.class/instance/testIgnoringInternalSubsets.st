tests
testIgnoringInternalSubsets
	| html docWithSubset docWithoutSubset |

	html :=
		'<html>
			<head><title>test</title></head>
			<body><p>test</p></body>
		</html>'.
	docWithSubset := XMLHTMLParser parse: '<!DOCTYPE html [
		<!ELEMENT html ANY>
		<!ENTITY lang "en-us">
		<!ATTLIST html xml:lang CDATA #FIXED "&lang;">
		<!--end-->]>', html.
	self
		deny: docWithSubset doctypeDeclaration isNil;
		assert: docWithSubset doctypeDeclaration root = 'html';
		deny: docWithSubset doctypeDeclaration hasChildren.

	docWithoutSubset := XMLHTMLParser parse: '<!DOCTYPE html>', html.
	self
		deny: docWithoutSubset doctypeDeclaration isNil;
		assert: docWithoutSubset doctypeDeclaration root = 'html';
		deny: docWithoutSubset doctypeDeclaration hasChildren.

	self assert: docWithSubset printString = docWithoutSubset printString.