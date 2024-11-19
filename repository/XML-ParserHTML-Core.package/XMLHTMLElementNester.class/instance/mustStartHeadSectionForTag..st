private
mustStartHeadSectionForTag: anHTMLTagInfo
	^ self startedBodySection not
		and: [self startedHeadSection not
			and: [anHTMLTagInfo isHeadSectionOnlyTag]]