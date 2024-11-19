tokenizing
nextDoctypeDeclarationOrCommentOrCDataSection
	| nextChar |

	"skip !"
	streamReader next.
	(nextChar := streamReader peek) == $-
		ifTrue: [^ self nextComment].
	nextChar == $[
		ifTrue: [
			^ self
				nextStartContent;
				nextCDataSection].
	state isPostDoctypeDeclarationState
		ifTrue: [^ self skipDeclaration].
	self nextDoctypeDeclaration.