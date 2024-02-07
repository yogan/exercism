function to_roman(number)
    if number ∈ 1:3999
        return roman_rec(number)
    end

    throw(ErrorException("$number cannot be represented in Roman numerals."))
end

function roman_rec(number)
    if number >= 1000
        return "M" * roman_rec(number - 1000)
    elseif number >= 900
        return "CM" * roman_rec(number - 900)
    elseif number >= 500
        return "D" * roman_rec(number - 500)
    elseif number >= 400
        return "CD" * roman_rec(number - 400)
    elseif number >= 100
        return "C" * roman_rec(number - 100)
    elseif number >= 90
        return "XC" * roman_rec(number - 90)
    elseif number >= 50
        return "L" * roman_rec(number - 50)
    elseif number >= 40
        return "XL" * roman_rec(number - 40)
    elseif number >= 10
        return "X" * roman_rec(number - 10)
    elseif number >= 9
        return "IX" * roman_rec(number - 9)
    elseif number >= 5
        return "V" * roman_rec(number - 5)
    elseif number >= 4
        return "IV" * roman_rec(number - 4)
    elseif number >= 1
        return "I" * roman_rec(number - 1)
    else
        return ""
    end
end
