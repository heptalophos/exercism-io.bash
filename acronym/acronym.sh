#!/usr/bin/env bash

acronym () {
    local -a ws
    (( $# == 1 )) && IFS=' -_*' read -r -a ws <<< "${1^^}" || exit 1
    for w in "${ws[@]^}"
    do
        echo -n "${w:0:1}"
    done <<< "${ws[@]^}"
}

main() {
    acronym "$1" && exit 0
}

set -e -u

main "$@"
