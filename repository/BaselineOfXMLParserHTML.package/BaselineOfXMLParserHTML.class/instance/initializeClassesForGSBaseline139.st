baseline
initializeClassesForGSBaseline139
	"All lazily initialized class and class instance variables must be
	explicitly initialized on GS during installation to prevent write
	conflicts between Gems later on. 
	
	This can help identify classes that use lazy initialization:
		ConfigurationOfXMLParser findLazyInitializedClassStateInPackage:
			'XML-ParserHTML-Core'
	"

	XMLHTMLNonHTMLSectionState allSubclassesDo: [:each |
		each instance]