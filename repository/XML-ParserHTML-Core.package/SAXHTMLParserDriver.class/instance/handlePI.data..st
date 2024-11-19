handling
handlePI: aTargetString data: aDataString
	self isDeferringEvents
		ifTrue: [
			self
				deferEventSelector: #processingInstruction:data:
				arguments:
					(Array
						with: aTargetString
						with: aDataString)]
		ifFalse: [
			self saxHandler 
				processingInstruction: aTargetString
				data: aDataString]