class AllYourBase {

    private final def inputBase
    private final def digits

    AllYourBase(inputBase, digits) {
        this.inputBase = inputBase
        this.digits = digits
    }

    def rebase(outputBase) {
        if (inputBase <= 1) {
            throw new ArithmeticException("Input base must be greater than 1")
        }

        if (outputBase <= 1) {
            throw new ArithmeticException("Output base must be greater than 1")
        }

        if (digits.any { it < 0 }) {
            throw new ArithmeticException("Input digits may not be negative")
        }

        if (digits.any { it >= inputBase }) {
            throw new ArithmeticException("All digits must satisfy 0 <= digit < input base")
        }

        def number = digits.inject(0) { acc, digit -> acc * inputBase + digit }

        if (number == 0) return [0]

        def output = []
        while (number > 0) {
            output.add(0, number % outputBase)
            number = (number / outputBase).toInteger()
        }
        output
    }

}
