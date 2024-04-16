class Squares {
    var n: Int
    init(_ n: Int) {
        self.n = n
    }

    var squareOfSum: Int {
        var sum = 0
        for i in 1 ... n {
            sum += i
        }
        return sum * sum
    }

    var sumOfSquares: Int {
        var sum = 0
        for i in 1 ... n {
            sum += i * i
        }
        return sum
    }

    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
}
