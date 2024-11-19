tests
testParsingNonHTMLSections
	| document |

	document := XMLHTMLParser parse:
		'<head><Title><b>"title&quot;</b></TITLE><SCRIPT>',
		'1 < 2; 3 > 2; document.write("&lt;</Script>");</Script>
		<Style>//"</STYLE><HEAD><body><textarea><one>&amp;<two></textarea>'.
	self
		assert: (document findElementNamed: 'title') contentString = '<b>"title"</b>';
		assert: (document findElementNamed: 'script') contentString =
			'1 < 2; 3 > 2; document.write("&lt;</Script>");';
		assert: (document findElementNamed: 'style') contentString = '//"';
		assert: (document findElementNamed: 'textarea') contentString = '<one>&<two>'.