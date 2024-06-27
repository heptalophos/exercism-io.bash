#!/usr/bin/env bash

main () {
    set -e -u
    declare -a ws
    IFS=' -_*' read -r -a ws <<<"${1^^}"
    for w in "${ws[@]^}"
    do
        echo -n "${w:0:1}"
    done
}

main "$@"

