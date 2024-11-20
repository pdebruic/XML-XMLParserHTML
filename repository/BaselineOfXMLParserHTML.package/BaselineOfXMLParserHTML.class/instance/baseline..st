baseline
baseline: spec

	<baseline>
	spec for: #common do: [ 
		self xmlParserOn: spec.
		spec
			package: 'XML-ParserHTML-Core'
			with: [ spec requires: #( 'XMLParser' ) ];
			package: 'XML-ParserHTML-Tests'
			with: [ 
				spec requires: #( 'XML-ParserHTML-Core' 'XMLParser Tests') ].

		"Groups"
		spec
			group: 'Core' with: #( 'XML-ParserHTML-Core' );
			group: 'Tests' with: #( 'XML-ParserHTML-Tests' );
			group: 'all' with: #( 'Core'  'Tests' );
			group: 'default' with: #( 'Core' ) ].
	spec for: #gemstone do: [ 
		spec
			package: 'XML-ParserHTML-Core'
			with: [ spec includes: 'XML-ParserHTML-GemstoneCompatibility' ].
		spec
			package: 'XML-ParserHTML-GemstoneCompatibility'
			with: [ spec requires: 'XML-ParserHTML-Core' ].
		"force initialization of lazy-initialized class and class isnt
			vars to avoid write conflicts on GS"
		spec postLoadDoIt: #initializeClassesForGSBaseline139 ]