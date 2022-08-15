object ScrabbleScore {

    private val scores = hashMapOf<Char, Int>()

    init {
        for (c in listOf('a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't')) {
            scores[c] = 1
        }
        for (c in listOf('d', 'g')) {
            scores[c] = 2
        }
        for (c in listOf('b', 'c', 'm', 'p')) {
            scores[c] = 3
        }
        for (c in listOf('f', 'h', 'v', 'w', 'y')) {
            scores[c] = 4
        }

        scores['k'] = 5

        for (c in listOf('j', 'x')) {
            scores[c] = 8
        }
        for (c in listOf('q', 'z')) {
            scores[c] = 10
        }
    }

    private fun scoreLetter(c: Char): Int {
        return scores.getValue(c.lowercaseChar())
    }

    fun scoreWord(word: String): Int {
        return word.fold(0) { acc, c -> acc + scoreLetter(c) }
    }
}
