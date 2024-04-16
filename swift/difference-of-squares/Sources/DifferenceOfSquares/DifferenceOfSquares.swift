class Squares {
    var numbers: ClosedRange<Int>

    init(_ n: Int) {
        numbers = 1 ... n
    }

    var squareOfSum: Int {
        let sum = numbers.reduce(0, +)
        return sum * sum
    }

    var sumOfSquares: Int {
        return numbers.map { $0 * $0 }.reduce(0, +)
    }

    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
}
