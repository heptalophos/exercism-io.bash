#!/usr/bin/env bash

errexit() {
    echo "$*" >&2 && exit 1
}

grains() {
    # shopt -s extglob nullglob
    case "$1" in
    total) 
        printf "%u\n" $(( 0xffffffffffffffff )) ;;
    [1-9]|[1-5][0-9]|6[0-4]) 
        printf "%u\n" $(( 1 << "$1"-1 )) ;;
    *) 
        errexit "Error: invalid input" ;;
    esac
}

main() {
    [[ "$#" != 1 ]] && errexit "Error: invalid input"
    grains "$1" && exit 0
}

set -e -u && main "$@"
