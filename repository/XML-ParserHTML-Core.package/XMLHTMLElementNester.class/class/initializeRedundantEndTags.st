class initialization
initializeRedundantEndTags
	"assign after with #yourself to avoid possible race
	conditions when reinitializing the class"
	RedundantEndTags := self voidElements asSet