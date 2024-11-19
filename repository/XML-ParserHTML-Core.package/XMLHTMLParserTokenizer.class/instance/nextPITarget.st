tokenizing
nextPITarget
	| target |

	((target := self nextElementName) = 'xml'
		and: [state isXMLDeclarationState])
		ifTrue: [^ nil]
		ifFalse: [^ target]