nesting
endElement: anElement
	| association |

	association :=
		self openElementsByName
			associationAt: anElement
			ifAbsent: [self openElementsByName add: (anElement -> 1)].
	association value: (association value - 1 max: 0).

	self endCurrentElement.