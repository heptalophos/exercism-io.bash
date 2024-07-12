#!/usr/bin/env bash

armstrong() {
    local -i num="$1" sum=0 power=${#1} digit=0
    while read -r -n1 digit; do
        sum+=$((digit ** power))
    done <<< "$num"
    (("$sum" == "$num")) && echo "true" || echo "false" 
}

main() {
    armstrong "$1" && exit 0
}

set -e -u

main "$@"
