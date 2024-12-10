#!/usr/bin/env bash

eggs() {
    local -i num="$1" count=0
    while (( num )); do
        (( num & 1 )) && (( ++count )) && (( num >>= 1 )) || (( num >>= 1 ))
    done
    echo "$count"	
}

main() { eggs "$1" && exit 0; }

set -eu && main "$@"
