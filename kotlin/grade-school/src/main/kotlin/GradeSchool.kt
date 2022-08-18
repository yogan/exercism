class School {

    private val roster = mutableMapOf<Int, MutableList<String>>().withDefault { mutableListOf() }

    fun add(student: String, grade: Int) {
        // FIXME: Why do we have to get the list, add something, and write it back?
        // Why does this ↓ not work?
        // roster.getValue(grade).add(student)

        var students = roster.getValue(grade)
        students.add(student)
        roster[grade] = students
    }

    fun grade(grade: Int): List<String> {
        return roster.getValue(grade).sorted()
    }

    fun roster(): List<String> {
        return roster.toSortedMap().values.flatMap { it.sorted() }
    }
}
