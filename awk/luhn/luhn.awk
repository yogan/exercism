BEGIN { FS = "" }
/^[[:space:]]*0?[[:space:]]*$/ {
    print "false"
    exit
}
{
    for (i = NF; i > 0; i = i - 1) {
        if ($i ~ /[[:space:]]/)
            continue

        if ($i !~ /[[:digit:]]/) {
            print "false"
            exit
        }

        digits = digits + 1

        if (digits % 2 == 0) {
            $i = $i * 2
            if ($i > 9)
                $i = $i - 9
        }

        sum = sum + $i
    }

    if (sum % 10 == 0)
        print "true"
    else
        print "false"
}
