initialization
initialize
	super initialize.

	isHTMLTag := false.
	isHeadTag := false.
	isBodyTag := false.
	isBodySectionTag := false.
	isHeadSectionTag := false.
	isNonNestable := false.
	nestableTagGroup := #().