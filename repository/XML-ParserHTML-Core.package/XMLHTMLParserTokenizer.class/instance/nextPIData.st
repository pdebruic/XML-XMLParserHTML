tokenizing
nextPIData
	| nextChar |

	characterStream reset.
	[(nextChar := streamReader next) == nil
		or: [nextChar == $?
			and: [streamReader peek == $>]]]
		whileFalse: [characterStream nextPut: nextChar].
	self nextMarkupTerminator.
	^ characterStream contents.