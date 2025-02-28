#!/usr/bin/env bash

rot_cipher () {
    local plaintext="$1" cipher=""
    local -i rot="$2" idx ridx
    local -A map
    while (( rot < 0 )); do (( rot += 26 )); done
    (( rot %= 26 ))
    local -ra alphabet=( {a..z} )
    for (( idx = 0; idx < ${#alphabet[@]}; idx++ )); do
        (( ridx = (idx + rot) % 26 ))
        map[${alphabet[idx]}]="${alphabet[ridx]}"
        map[${alphabet[idx]^^}]="${alphabet[ridx]^^}"
    done
    
    for (( idx = 0; idx < ${#plaintext}; idx++ )); do
        char=${plaintext:idx:1}
        [[ -n ${map[$char]} ]] && char="${map[$char]}"
        cipher+="$char"
    done
    echo "$cipher"
}

main() {
    rot_cipher "$@" && exit 0
}

set -e && main "$@"



