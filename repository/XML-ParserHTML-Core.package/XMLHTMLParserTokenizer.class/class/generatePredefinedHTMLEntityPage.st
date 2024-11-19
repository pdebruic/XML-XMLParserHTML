private
generatePredefinedHTMLEntityPage
	"
	self generatePredefinedHTMLEntityPage
	"
	| entityAssociations json |

	entityAssociations := OrderedCollection new.
	json :=
		(XMLClassFinder classNamed: #NeoJSONReader) fromString:
			'http://www.w3.org/TR/html5/entities.json' asXMLURI get.
	json keysAndValuesDo: [:key :value |
		entityAssociations addLast:
			key allButFirst allButLast ->
				(value at: 'codepoints') first].
	entityAssociations sort: [:a :b | a key <= b key].

	self compilePredefinedHTMLEntityPageWithEntities: entityAssociations.