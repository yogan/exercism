proc abbreviate {phrase} {
    set words [split $phrase { -}]

    set res ""

    foreach word $words {
        set letters [regsub -all -nocase {[^a-z]} $word ""]
        set first [string toupper [string index $letters 0]]
        set res "$res$first"
    }

    return $res
}
