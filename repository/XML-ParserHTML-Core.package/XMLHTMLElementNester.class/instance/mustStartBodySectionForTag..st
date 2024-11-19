private
mustStartBodySectionForTag: anHTMLTagInfo
	^ self startedBodySection not
		and: [anHTMLTagInfo isBodySectionOnlyTag
			or: [self startedHeadSection not
				and: [anHTMLTagInfo isHeadSectionOnlyTag not]]]