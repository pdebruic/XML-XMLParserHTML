decoding
convertFromEncoding: anEncodingName
	| encodingNameWithoutWhitespace |

	encodingNameWithoutWhitespace := anEncodingName xmlCopyWithoutWhitespace.
	encodingNameWithoutWhitespace isEmpty
		ifFalse: [super convertFromEncoding: encodingNameWithoutWhitespace]