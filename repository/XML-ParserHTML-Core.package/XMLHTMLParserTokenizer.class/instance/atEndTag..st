testing
atEndTag: aTagName
	| matched |

	streamReader peek == $<
		ifFalse: [^ false].
	streamReader next.

	streamReader peek == $/
		ifFalse: [
			streamReader pushBackCharacter: $<.
			^ false].
	streamReader next.

	1 to: aTagName size do: [:i | | nextChar |
		((nextChar := streamReader peek) notNil
			and: [
				"use #= here because the tag name and nextChar can be wide chars
				and wide chars aren't #== pre-Spur"
				nextChar asLowercase = (aTagName at: i)])
			ifFalse: [
				streamReader pushBack: '</', (aTagName copyFrom: 1 to: i - 1).
				^ false].
		streamReader next].

	matched :=
		(streamReader atEnd not
			and: [HTMLNameDelimiters includes: streamReader peek]).
	streamReader pushBack: '</', aTagName.

	^ matched.