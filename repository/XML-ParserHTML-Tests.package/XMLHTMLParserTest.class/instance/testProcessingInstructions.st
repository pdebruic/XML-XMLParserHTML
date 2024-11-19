tests
testProcessingInstructions
	| document html body |

	document := XMLHTMLParser parse: '<?one two?><body><?three four?></body><?five six?>'.
	self
		assert: document nodes size = 2;
		assert: document nodes first isPI;
		assert: document nodes first target = 'one';
		assert: document nodes first data = 'two';
		assert: (document nodes second isElementNamed: 'html').

	html := document nodes second.
	self
		assert: html nodes size = 2;
		assert: (html nodes first isElementNamed: 'body');
		assert: html nodes second isPI;
		assert: html nodes second target = 'five';
		assert: html nodes second data = 'six'.
	
	body := html nodes first.
	self
		assert: body nodes size = 1;
		assert: body nodes first isPI;
		assert: body nodes first target = 'three';
		assert: body nodes first data = 'four'.