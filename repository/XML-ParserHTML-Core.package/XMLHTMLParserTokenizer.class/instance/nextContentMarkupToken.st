tokenizing
nextContentMarkupToken
	"use #isXMLWhitespace instead of the narrower, XML-specific
	#isXMLSeparator, and since nil understands #isXMLWhitespace
	no nil test is needed"
	streamReader peek isXMLWhitespace
		ifTrue: [
			streamReader pushBack: '&lt;'.
			^ self nextPCDataToken].
	streamReader peek == $?
		ifTrue: [^ self nextPI].
	streamReader peek == $!
		ifTrue: [
			streamReader next.
			streamReader peek == $-
				ifTrue: [^ self nextComment].
			streamReader peek == $[
				ifTrue: [^ self nextCDataSection].
			^ self skipDeclaration].
	self nextTag.