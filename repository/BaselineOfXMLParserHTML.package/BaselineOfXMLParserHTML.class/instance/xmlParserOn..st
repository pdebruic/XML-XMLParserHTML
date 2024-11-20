baseline
xmlParserOn: spec

	spec for: #pharo do: [ 
		spec baseline: 'XMLParser' with: [ 
			spec
				loads: #( 'Core' );
				repository: 'github://pharo-contributions/XML-XMLParser/src' ] ].
	spec for: #gemstone do: [ 
		spec baseline: 'XMLParser' with: [ 
			spec
				loads: #( 'Core' );
				repository: 'github://gsdevkit/xml-xmlparser:gemstone/filetree' ] ].
	spec for: #common do: [ 
		spec
			project: 'XMLParser Tests'
			copyFrom: 'XMLParser'
			with: [ spec loads: #( 'Tests' ) ] ]