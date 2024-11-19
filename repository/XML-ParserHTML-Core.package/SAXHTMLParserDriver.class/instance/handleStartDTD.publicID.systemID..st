handling - dtd
handleStartDTD: aRoot publicID: aPublicID systemID: aSystemID
	self saxHandler
		startDTD: aRoot
		publicID: aPublicID
		systemID: aSystemID.