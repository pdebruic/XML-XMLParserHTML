tests
testCharacterReferencesUnreplaced
	self assert:
		((XMLHTMLParser on: '&#60; &#x3c &#X3E &#62; &#62end &#x2Astar &#0; &#-1 &#inval; &#inval &#')
			replacesContentEntityReferences: false;
			parseDocument) contentString =
				'&#60; &#x3c &#X3E &#62; &#62end &#x2Astar &#0; &#-1 &#inval; &#inval &#'