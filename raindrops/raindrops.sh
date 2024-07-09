#!/usr/bin/env bash

errorexit() { 
    echo "$1" >&2 && exit 1 
}
raindrops() {
    [[ $# -ne 1 || "$1" = *[^0-9]* ]] && 
    errorexit "Usage: raindrops <number>"
    local drops=( [3]=Pling [5]=Plang [7]=Plong ) rain=''
    for i in "${!drops[@]}" 
    do
        (( $1 % i == 0 )) && rain+=${drops[i]}
    done 
    printf '%s\n' "${rain:-$1}"
}
main() { 
    raindrops "$1" && exit 0 
}

set -e -u
main "$@"
