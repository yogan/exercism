class Matrix(private val matrixAsString: String) {

    private var matrix =
            matrixAsString.lines() //
                    .map { it.split(" ").map { it.toInt() } }

    fun column(colNr: Int): List<Int> = matrix.map { it[colNr - 1] }

    fun row(rowNr: Int): List<Int> = matrix[rowNr - 1]
}
