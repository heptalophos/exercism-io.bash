#!/usr/bin/env bash

sieve() {
    local -i limit="$1"
    local -a prime primes
    for i in $(seq 2 "$limit"); do prime[i]=true; done
    for (( j=2; j**2<=limit; ++j )); do
        (! ${prime[j]}) && continue  
        for (( m=j**2; m<=limit; m+=j )); do prime[m]=false; done
    done
    for (( n=2; n<=limit; ++n )); do 
        ${prime[n]} && primes+=("$n")
    done
    echo "${primes[*]}"
}

main() {
    sieve "$1" && exit 0
}

set -eu && main "$@"
