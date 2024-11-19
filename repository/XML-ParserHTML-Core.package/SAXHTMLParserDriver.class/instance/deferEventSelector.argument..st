private
deferEventSelector: aSelector argument: anArgument
	^ self
		deferEventSelector: aSelector
		arguments: (Array with: anArgument)