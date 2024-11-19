decoding
processMetaAttributes: anAttributeDictionary
	"check for a basic meta charset first, like <meta charset='UTF-8'>"
	self convertFromEncoding:
		(anAttributeDictionary
			at: 'charset'
			ifAbsent: [| mimeType |
				"otherwise look for an http-equiv content type, like:
					<meta
						http-equiv='Content-Type'
						content='text/html; charset=UTF-8'>"
				(anAttributeDictionary at: 'http-equiv') asLowercase = 'content-type'
					ifFalse: [^ self].
				mimeType :=
					XMLHTTPMIMEType fromString:
						(anAttributeDictionary
							at: 'content'
							ifAbsent: [^ self]).
				mimeType charset])