class initialization
initializeHTMLNameDelimiters
	"assign after with #yourself to avoid possible race
	conditions when reinitializing the class"
	HTMLNameDelimiters :=
		BitmapCharacterSet new
			"#xmlWhitespace is used instead of #xmlSeparators,
			which is a narrower range of chars specific to XML"
			addAll: Character xmlWhitespace;
			add: $>;
			add: $/;
			add: $<;
			add: $=;
			add: $";
			add: $';
			add: $;;
			yourself