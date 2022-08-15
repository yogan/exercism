object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        if (leftStrand.length != rightStrand.length) {
            throw IllegalArgumentException("left and right strands must be of equal length")
        }

        return (leftStrand.toCharArray().toList() zip //
                rightStrand.toCharArray().toList())
                .filter { (first, second) -> first != second }
                .size
    }
}
