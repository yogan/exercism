"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    I = Set(input |> lowercase)
    L = Set('a':'z')
    return L ⊆ I
end
