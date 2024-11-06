#!/usr/bin/env bash

exitzero() { echo "$*" && exit 0;}

main() {
    set -o noglob 
    # shellcheck disable=2206
    local list1=(${1//[\[\],]/}) list2=(${2//[\[\],]/})
    local -i size1=${#list1[@]} size2=${#list2[@]}
    ((size1 > size2)) &&
    for ((i=0; i<=(size1-size2); i++)); do
        [[ ${list1[*]:i:size2} == "${list2[*]}" ]] && exitzero superlist
    done
    ((size1 < size2)) &&
    for ((i=0; i<=(size2-size1); i++)); do
        [[ ${list2[*]:i:size1} == "${list1[*]}" ]] && exitzero sublist
    done          
    [[ ${list1[*]} == "${list2[*]}" ]] && exitzero equal || exitzero unequal
}

set -eu && main "$@" && exit 0