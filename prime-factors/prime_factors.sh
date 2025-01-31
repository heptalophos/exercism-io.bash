#!/usr/bin/env bash

prime_factors() {
    local -i num="$1" p=2
    local -a pfactors=()
    while (( p ** 2 < num + 1 )) 
    do
        (( num % p )) && (( p += 1 + (p != 2) )) && continue
        (( num /= p))
        pfactors+=("$p")
    done
    (( num > 1 )) && pfactors+=("$num")    
    echo "${pfactors[*]}"
}

main() {
    prime_factors $1 && exit 0
}

set -eu && main $@
