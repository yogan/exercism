"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    input |> lowercase |> Set |> c -> c ∩ Set('a':'z') == Set('a':'z')
end
