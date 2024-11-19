private
startElement: anElement attributes: anAttributeDictionary
	elementNester startElement: anElement.
	driver
		handleStartTag: anElement
		attributes: anAttributeDictionary.