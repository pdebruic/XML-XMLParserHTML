tokenizing
nextNonPIPrologOrContentMarkupToken
	streamReader peek == $!
		ifTrue: [^ self nextDoctypeDeclarationOrCommentOrCDataSection].

	self nextStartContent.
	"use #isXMLWhitespace instead of the narrower, XML-specific
	#isXMLSeparator, and since nil understands #isXMLWhitespace
	no nil test is needed"
	streamReader peek isXMLWhitespace
		ifFalse: [^ self nextTag].

	"an unescaped < in pcdata content"
	streamReader pushBackCharacter: $<.
	^ self nextContentToken.