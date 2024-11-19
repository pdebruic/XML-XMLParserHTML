initialization
setSAXHandler: aSAXHandler
	super setSAXHandler: aSAXHandler.

	isDeferringEvents := false.
	deferredEvents := OrderedCollection new: 5.