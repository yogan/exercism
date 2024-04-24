package pangram

import (
	"strings"
)

func IsPangram(input string) bool {
	var chars = strings.Split(strings.ToLower(input), "")
	var charMap = make(map[string]bool)

	for _, char := range chars {
		if char >= "a" && char <= "z" {
			charMap[char] = true
		}
	}

	return len(charMap) == len("abcdefghijklmnopqrstuvwxyz")
}
