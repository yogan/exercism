data class Item(val weight: Int, val value: Int)

fun knapsack(maximumWeight: Int, items: List<Item>): Int {
    when {
        items.isEmpty() -> return 0
        items.first().weight > maximumWeight -> return 0
        else -> {
            val first = items.first()
            val rest = items.drop(1)

            val withFirst = first.value + knapsack(maximumWeight - first.weight, rest)
            val withoutFirst = knapsack(maximumWeight, rest)

            return Math.max(withFirst, withoutFirst)
        }
    }
}
