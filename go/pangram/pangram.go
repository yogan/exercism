package pangram

import (
	"strings"
)

const NumberOfLetters = len("abcdefghijklmnopqrstuvwxyz")

func IsPangram(input string) bool {
	var charMap = map[rune]bool{}

	for _, char := range strings.ToLower(input) {
		if char >= 'a' && char <= 'z' {
			charMap[char] = true
		}
	}

	return len(charMap) == NumberOfLetters
}
