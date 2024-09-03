#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

darts() {
    # (( $# != 2 )) || [[ "$1" =~ [^0-9] || "$2" =~ [^0-9] ]] && 
    [[ "$#" -lt 2 || (! "${*}" =~ [[:digit:]]) ]] && 
    errexit "Usage: ${0#*} <x> <y>"
    local sumsq=`awk 'BEGIN { print (ARGV[1] ** 2 + ARGV[2] ** 2) }' $1 $2`
    local radius=`awk 'BEGIN { print (ARGV[1] ** (1.0 / ARGV[2])) }' "$sumsq" 2`
    local points=0
    if (( $(echo "$radius <= 10" | bc -l) )); then 
        (( points += 1 )) 
    fi
    if (( $(echo "$radius <= 5" | bc -l) )); then 
        (( points += 4 )) 
    fi
    if (( $(echo "$radius <= 1" | bc -l) )); then 
        (( points += 5 )) 
    fi
    echo $points
}

main() {
    darts "$1" "$2" && exit 0
}

set -e -u && main "$@"
