private
deferEventSelector: aSelector arguments: anArgumentArray
	^ deferredEvents addLast:
		(MessageSend
			receiver: self saxHandler
			selector: aSelector
			arguments: anArgumentArray)