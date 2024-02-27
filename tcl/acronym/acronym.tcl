proc abbreviate {phrase} {
    set chars [list]

    foreach word [split $phrase { -}] {
        set letters [regsub -all -nocase {[^a-z]} $word ""]
        lappend chars [string toupper [string index $letters 0]]
    }

    return [join $chars ""]
}
