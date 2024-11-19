This class is a DOM parser that turns invalid and malformed HTML into a DOM tree. All tag and attribute names are converted to lowercase and markup is unrecognized in <script>, <style>, <title>, and <textarea> sections.

(If printing the DOM tree, use printWithoutSelfClosingTagsOn: or printedWithoutSelfClosingTags to avoid empty elements being printed as self-closing tags, because some (like <script/>) are not handled correctly by browsers.)