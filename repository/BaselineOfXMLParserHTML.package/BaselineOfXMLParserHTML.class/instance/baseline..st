baseline
baseline: spec

	<baseline>
	spec for: #common do: [ 
		self xmlParserOn: spec.

		"Packages"
		spec
			package: 'XML-ParserHTML-Core'
			with: [ spec requires: #( 'XMLParser' ) ];
			package: 'XML-ParserHTML-Tests'
			with: [ 
				spec requires: #( 'XMLParser Tools' 'XML-ParserHTML-Core' ) ].

		"Groups"
		spec
			group: 'Core' with: #( 'XML-ParserHTML-Core' );
			group: 'Tools' with: #( 'XMLParser Tools' );
			group: 'Tests' with: #( 'XML-ParserHTML-Tests' );
			group: 'all' with: #( 'Core' 'Tools' 'Tests' );
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