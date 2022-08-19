class School {

    private val roster = mutableMapOf<Int, MutableList<String>>()

    fun add(student: String, grade: Int) {
        roster.getOrPut(grade) { mutableListOf() }.add(student)
    }

    fun grade(grade: Int): List<String> {
        return roster.getOrDefault(grade, listOf()).sorted()
    }

    fun roster(): List<String> {
        return roster.toSortedMap().values.flatMap { it.sorted() }
    }
}
