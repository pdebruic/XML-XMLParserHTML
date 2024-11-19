tokenizing
nextComment
	| hyphensRead nextChar |

	"Skip first -"
	streamReader next.
	self expectNext: $-.
	hyphensRead := 0.
	characterStream reset.
	[(nextChar := streamReader next) == nil
		or: [nextChar == $>
			and: [hyphensRead = 2]]]
		whileFalse: [
			nextChar == $-
				ifTrue: [
					hyphensRead = 2
						ifTrue: [characterStream nextPut: $-]
						ifFalse: [hyphensRead := hyphensRead + 1]]
				ifFalse: [
					hyphensRead > 0
						ifTrue: [
							1 to: hyphensRead do: [:i |
								characterStream nextPut: $-].
							hyphensRead := 0].
					characterStream nextPut: nextChar]].
	driver handleComment: characterStream contents.