testing
hasDeferredEvents
	^ self isDeferringEvents
		and: [deferredEvents notEmpty]