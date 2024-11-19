private
htmlTagInformationIn: aDictionary named: aName
	^ aDictionary
		at: aName
		ifAbsentPut: [XMLHTMLTagInformation named: aName]