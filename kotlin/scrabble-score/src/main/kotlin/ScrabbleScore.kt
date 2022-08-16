object ScrabbleScore {

    private fun scoreLetter(char: Char): Int =
            when (char.lowercaseChar()) {
                'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' -> 1
                'd', 'g' -> 2
                'b', 'c', 'm', 'p' -> 3
                'f', 'h', 'v', 'w', 'y' -> 4
                'k' -> 5
                'j', 'x' -> 8
                'q', 'z' -> 10
                else -> throw AssertionError("no value for '$char'")
            }

    fun scoreWord(word: String): Int {
        return word.fold(0) { acc, char -> acc + scoreLetter(char) }
    }
}
