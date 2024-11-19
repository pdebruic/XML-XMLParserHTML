class initialization
initializeHTMLTagInformation
	| temp |

	"use a temp to fully initialize it before assignment to avoid
	possible race conditions during class reinitialization"
	temp := Dictionary new.

	#('html' 'head' 'body') do: [:each |
		self
			htmlTagInformationIn: temp
			named: each].

	self bodySectionElements do: [:each |
		(self
			htmlTagInformationIn: temp
			named: each) isBodySectionTag: true].
	self headSectionElements do: [:each |
		(self
			htmlTagInformationIn: temp
			named: each) isHeadSectionTag: true].

	self mutuallyExcludingTags keysAndValuesDo: [:key :value |
		(self
			htmlTagInformationIn: temp
			named: key) mutuallyExcludingTag: value].
	self nestableTagGroups keysAndValuesDo: [:key :value |
		(self
			htmlTagInformationIn: temp
			named: key) nestableTagGroup: value].

	self nonNestableElements do: [:each |
		(self
			htmlTagInformationIn: temp
			named: each) isNonNestable: true].

	HTMLTagInformation := temp.