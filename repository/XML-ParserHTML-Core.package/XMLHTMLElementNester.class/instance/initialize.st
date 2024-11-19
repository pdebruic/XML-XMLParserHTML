initialization
initialize
	super initialize.

	openElementsByName := Dictionary new.
	startedHTMLSection := false.
	startedHeadSection := false.
	startedBodySection := false.