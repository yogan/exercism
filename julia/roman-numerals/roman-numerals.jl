function to_roman(number)
    if number ∉ 1:3999
        throw(ErrorException("$number can't be represented in Roman numerals."))
    end

    roman_table(number)
    # roman_rec(number)
end

# Table-based version
function roman_table(number)
    table = (
        ("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"),
        ("X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"),
        ("C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"),
        ("M", "MM", "MMM"),
    )

    map((digit, row) -> digit > 0 ? row[digit] : "",
        digits(number), table) |> reverse |> join
end

# Alternative, recursive version
function roman_rec(number)
    if number >= 1000
        "M"  * roman_rec(number - 1000)
    elseif number >= 900
        "CM" * roman_rec(number - 900)
    elseif number >= 500
        "D"  * roman_rec(number - 500)
    elseif number >= 400
        "CD" * roman_rec(number - 400)
    elseif number >= 100
        "C"  * roman_rec(number - 100)
    elseif number >= 90
        "XC" * roman_rec(number - 90)
    elseif number >= 50
        "L"  * roman_rec(number - 50)
    elseif number >= 40
        "XL" * roman_rec(number - 40)
    elseif number >= 10
        "X"  * roman_rec(number - 10)
    elseif number >= 9
        "IX" * roman_rec(number - 9)
    elseif number >= 5
        "V"  * roman_rec(number - 5)
    elseif number >= 4
        "IV" * roman_rec(number - 4)
    elseif number >= 1
        "I"  * roman_rec(number - 1)
    else
        ""
    end
end
