import spock.lang.*

class AllYourBaseSpec extends Specification {

    def "Single bit one to decimal"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits | outputBase || expected
        2         | [1]    | 10         || [1]
    }

    def "Single decimal to binary"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits | outputBase || expected
        10        | [5]    | 2          || [1, 0, 1]
    }

    def "Binary to multiple decimal"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits             | outputBase || expected
        2         | [1, 0, 1, 0, 1, 0] | 10         || [4, 2]
    }

    def "Decimal to binary"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits | outputBase || expected
        10        | [4, 2] | 2          || [1, 0, 1, 0, 1, 0]
    }

    def "Trinary to hexadecimal"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits       | outputBase || expected
        3         | [1, 1, 2, 0] | 16         || [2, 10]
    }

    def "Hexadecimal to trinary"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits  | outputBase || expected
        16        | [2, 10] | 3          || [1, 1, 2, 0]
    }

    def "15-bit integer"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits      | outputBase || expected
        97        | [3, 46, 60] | 73         || [6, 10, 45]
    }

    def "Empty list"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits | outputBase || expected
        2         | []     | 10         || [0]
    }

    def "Single zero"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits | outputBase || expected
        10        | [0]    | 2          || [0]
    }

    def "Multiple zeros"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits    | outputBase || expected
        10        | [0, 0, 0] | 2          || [0]
    }

    def "Leading zeros"() {
        given:
        def base = new AllYourBase(inputBase, digits)

        expect:
        base.rebase(outputBase) == expected

        where:
        inputBase | digits    | outputBase || expected
        7         | [0, 6, 0] | 10         || [4, 2]
    }

    def "Input base is one"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits | outputBase
        1         | [0]    | 10
    }

    def "Input base is zero"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits | outputBase
        0         | []     | 10
    }

    def "Input base is negative"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits | outputBase
        -2        | [1]    | 10
    }

    def "Negative digit"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits              | outputBase
        2         | [1, -1, 1, 0, 1, 0] | 10
    }

    def "Invalid positive digit"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits             | outputBase
        2         | [1, 2, 1, 0, 1, 0] | 10
    }

    def "Output base is one"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits             | outputBase
        2         | [1, 0, 1, 0, 1, 0] | 1
    }

    def "Output base is zero"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits | outputBase
        10        | [7]    | 0
    }

    def "Output base is negative"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits | outputBase
        2         | [1]    | -7
    }

    def "Both bases are negative"() {
        when:
        new AllYourBase(inputBase, digits).rebase(outputBase)

        then:
        thrown(ArithmeticException)

        where:
        inputBase | digits | outputBase
        -2        | [1]    | -7
    }

}
