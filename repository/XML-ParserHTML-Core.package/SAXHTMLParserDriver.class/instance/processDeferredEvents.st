private
processDeferredEvents
	[deferredEvents isEmpty]
		whileFalse: [deferredEvents removeFirst value]