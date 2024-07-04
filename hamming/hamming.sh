#!/usr/bin/env bash

errorexit() {
    echo $1 >&2 && exit 1
}

hamming() {
    test ${#@} -ne 2 && 
    errorexit "Usage: ${0#*} <string1> <string2>"
    test ${#1} -ne ${#2} && 
    errorexit "the two strands must be of equal length"
    local -i hdist=0    
    if test "$1" != "$2"; then
        for (( i = 0; i < ${#1}; ++i )); do
            [[ "${1:$i:1}" != "${2:$i:1}" ]] && 
            (( ++hdist ))
        done
    fi
    echo "$hdist" && exit 0
}

set -e -u

hamming "$@"
