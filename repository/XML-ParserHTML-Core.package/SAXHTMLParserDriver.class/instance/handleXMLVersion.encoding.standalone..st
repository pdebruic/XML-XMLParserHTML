handling
handleXMLVersion: aVersion encoding: anEncoding standalone: aYesOrNo
	self saxHandler
		xmlVersion:
			([Float readFrom: aVersion readStream]
				on: Error
				do: [:error | 1.0])
		encoding: anEncoding
		standalone: aYesOrNo = 'yes'