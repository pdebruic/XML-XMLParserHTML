class initialization
initializePredefinedHTMLEntities
	| temp entityPage entityName codePoint |

	"use a temp to fully initialize it before assignment to avoid
	possible race conditions during class reinitialization"
	temp := Dictionary new.
	entityPage := self predefinedHTMLEntityPage readStream.
	[entityPage atEnd]
		whileFalse: [
			entityName :=
				entityPage
					skipTo: $[;
					upTo: $=.
			codePoint := XMLSmallIntegerReader readFrom: entityPage.
			(entityName notEmpty
				and: [codePoint notNil])
				ifTrue: [
					temp
						at: entityName
						put: codePoint asCharacter]].
	PredefinedHTMLEntities := temp.