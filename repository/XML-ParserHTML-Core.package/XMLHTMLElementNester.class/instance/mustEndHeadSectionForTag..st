private
mustEndHeadSectionForTag: anHTMLTagInfo
	^ self startedBodySection not
		and: [self startedHeadSection
			and: [anHTMLTagInfo isBodyTag
				or: [anHTMLTagInfo isBodySectionOnlyTag]]]