tokenizing
nextStartNonHTMLElement: anElement
	state := 
		(NonHTMLCodeSectionTags includes: anElement)
			ifTrue: [XMLHTMLNonHTMLCodeSectionState new]
			ifFalse: [XMLHTMLNonHTMLSectionState new].
	nonHTMLElement := anElement.