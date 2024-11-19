private
processNonTerminatingDeferredEvents
	[deferredEvents isEmpty]
		whileFalse: [| deferredMessage |
			deferredMessage := deferredEvents removeFirst. 
			(deferredMessage selector == #endElement:prefix:uri:localName:
				and: [#('body' 'html') includes: deferredMessage arguments first])
				ifFalse: [deferredMessage value]]