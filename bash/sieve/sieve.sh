#!/usr/bin/env bash
limit=$1
mapfile -t numbers < <(seq 0 "$limit")

for n in "${!numbers[@]}"; do
    prime=${numbers[$n]}
    if [ "$prime" -lt 2 ]; then
        continue
    fi
    primes+=("$prime")
    mapfile -t multiples < <(seq $((2 * n)) "$n" "$limit")
    for m in "${multiples[@]}"; do
        numbers["$m"]=0
    done
done

echo "${primes[@]}"
