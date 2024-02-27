proc abbreviate {phrase} {
    set chars [list]

    foreach part [split $phrase { -}] {
        set word [regsub -all -nocase {[^a-z]} $part ""]
        lappend chars [string toupper [string index $word 0]]
    }

    return [join $chars ""]
}
