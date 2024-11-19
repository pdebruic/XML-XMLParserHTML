private
startInnerXMLElement: anElement forParser: aParser
	| elementNester |

	elementNester := aParser driver elementNester.
	elementNester
		beforeStarting: anElement name
		elementsToEndDo: [:each | ]
		elementsToStartDo: [:each | elementNester startElement: each].
	elementNester startElement: anElement name.