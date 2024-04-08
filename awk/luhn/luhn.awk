function invalid() {
    print "false"
    exit
}

BEGIN { FS = "" }

/^[[:space:]]*0?[[:space:]]*$/ { invalid() }

{
    for (i = NF; i > 0; i = i - 1) {
        if ($i ~ /[[:space:]]/)
            continue

        if ($i !~ /[[:digit:]]/)
            invalid()

        digits = digits + 1

        if (digits % 2 == 0) {
            $i = $i * 2
            if ($i > 9)
                $i = $i - 9
        }

        sum = sum + $i
    }

    print (sum % 10 == 0) ? "true" : "false"
}
