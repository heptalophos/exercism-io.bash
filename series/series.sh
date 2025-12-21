#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

series() {
    local -i digits="$1" span="$2" len=${#1}
    local -a slices=()

    [[ "$len" -eq 0 ]] && 
    errexit 'series cannot be empty'
    [[ "$span" -eq 0 ]] && 
    errexit 'slice length cannot be zero'
    [[ "$len" -lt "$span" ]] && 
    errexit 'slice length cannot be greater than series length'
    [[ "$span" -lt 0 ]] && 
    errexit 'slice length cannot be negative'
    
    for ((i = 0; i <= len - span; i++)) 
    do
        slices+=("${digits:i:span}")
    done
    echo "${slices[*]}"
}

main() { series "$@" && exit 0; }

set -eu && main "$@"
