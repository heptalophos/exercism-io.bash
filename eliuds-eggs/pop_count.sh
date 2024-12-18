#!/usr/bin/env bash

eggs() {
    local -i num="$1" count=0
    while (( num > -1 )); do
        (( ++count )) && (( num |= num + 1 ))
    done
    echo $(( 64 - "$count" ))	
}

main() { eggs "$1" && exit 0; }

set -eu && main "$@"
