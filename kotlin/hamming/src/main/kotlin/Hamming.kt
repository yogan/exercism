object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        require(leftStrand.length == rightStrand.length) {
            "left and right strands must be of equal length"
        }

        return (leftStrand.toCharArray() zip rightStrand.toCharArray())
                .filter { (first, second) -> first != second }
                .size
    }
}
