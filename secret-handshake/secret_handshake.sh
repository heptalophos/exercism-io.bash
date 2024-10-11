#!/usr/bin/env bash

handshake() {
    local -i secret="$1"
    local -a sequence=()
    (( secret & 0x01 )) && sequence+=(wink)
    (( secret & 0x02 )) && sequence+=('double blink')
    (( secret & 0x04 )) && sequence+=('close your eyes')
    (( secret & 0x08 )) && sequence+=(jump)
    (( secret & 0x10 )) && reverse sequence
    IFS=, && echo "${sequence[*]}"
}

reverse() {
    local -n list="$1"
    local -i i j len=${#list[@]} 
    local aux
    for (( i = 0, j = len - 1; i < j; ++i, j-- ))
    do
        aux=${list[i]}
        list[i]=${list[j]}
        list[j]=$aux
    done
}

main() {
    handshake "$1" && exit 0
}

set -e -u && main "$@"
