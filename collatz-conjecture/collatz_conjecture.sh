#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

collatz() {
    [[ $# -ne 1 || ! $1 =~ [[:digit:]] || $1 -lt 1 ]] && 
    errexit "Error: Only positive numbers are allowed"
    local -i num steps
    num="$1" ; steps=0
    while (( num > 1 )) 
    do
        case $(( num & 1 )) in
        0) (( num >>= 1 )) ;;
        1) (( num *= 3 )); (( num += 1 )) ;;
        *) errexit "Error: This should be unreachable"
        esac
        (( ++steps ))
    done
    echo "$steps"
}

main() {
    collatz "$1" && exit 0
}

set -e -u && main "$@"
