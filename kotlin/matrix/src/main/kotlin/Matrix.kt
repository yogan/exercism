class Matrix(private val matrixAsString: String) {

    private fun parseMatrix() =
            matrixAsString.lines() //
                    .map { it.split(" ").map { it.toInt() } }

    fun column(colNr: Int): List<Int> = parseMatrix().map { it[colNr - 1] }

    fun row(rowNr: Int): List<Int> = parseMatrix()[rowNr - 1]
}
