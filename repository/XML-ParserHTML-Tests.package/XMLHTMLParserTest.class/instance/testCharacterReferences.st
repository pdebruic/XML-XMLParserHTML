tests
testCharacterReferences
	self assert:
		(XMLHTMLParser parse: '&#60; &#x3c &#X3E &#62; &#62end &#x2Astar &#0; &#-1 &#inval; &#inval &#')
			contentString = '< < > > >end *star &#0; &#-1 &#inval; &#inval &#'.