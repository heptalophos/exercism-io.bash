#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

counts() {
    local strand="$1"
    local -A counts=([A]=0 [C]=0 [G]=0 [T]=0)
    for ((i=0; i < ${#strand}; ++i)); do
        local nucl="${strand:$i:1}"
        case "$nucl" in
        A | C | G | T) ((counts[$nucl]++));;
        *) errexit "Invalid nucleotide in strand";;
        esac
    done
    for n in A C G T; do
        echo "$n: ${counts[$n]}"
    done
}

main() {
    counts "$1" && exit 0
}

set -e -u && main "$@"
