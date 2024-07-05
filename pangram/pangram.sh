#!/usr/bin/env bash

pangram() {
    (( $# == 1 )) && sentence=${1^^} || exit 1
    local -A letters=()
    for i in $(seq 0 ${#1}); do
        gramma=${sentence:i:1}
        [[ $gramma =~ [A-Z] ]] && letters[$gramma]='yes' 
    done
    (( ${#letters[@]} == 26 )) && echo "true" || echo "false" 
}

main() {
    pangram "$1" && exit 0
}

set -e -u

main "$@"
