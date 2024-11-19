private
compilePredefinedHTMLEntityPageWithEntities: anAssociationCollection
	"There are too many entities to represent literally in a single method,
	so they're put in a big string and parsed at initialization."
	| source |

	source :=
		String streamContents: [:stream |
			stream
				nextPutAll: 'predefinedHTMLEntityPage';
				cr;
				nextPutAll: '	^ '''.
			anAssociationCollection do: [:each |
				stream
					cr;
					nextPutAll: '	[';
					nextPutAll: each key;
					nextPut: $=;
					nextPutAll: each value asString;
					nextPut: $]].
			stream nextPut: $'].

	self class
		compile: source contents
		classified: #private.