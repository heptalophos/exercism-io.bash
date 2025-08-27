#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

sum_of_multiples() {

    local -a factors="${@:2}" multiples=()
    local -i limit="$1" i=0 sum=0

    (( $limit <= 0 )) && errexit "limit not positive"
    (( ${#factors[@]} == 0 )) && errexit "no factors provided"

    for f in ${factors}; do
        if ((f != 0)); then
            for ((i = f; i < limit; i += f)); do
                multiples[$i]=1
            done
        fi
    done

    for factor in "${!multiples[@]}"; do
        ((sum += factor))
    done
    echo "$sum"
}

main() {
    sum_of_multiples "${1}" "${@:2}" && exit 0
}

set -e -u
main "$@"