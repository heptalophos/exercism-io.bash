#!/usr/bin/env bash

boolx() { (( $? == 0 )) && echo '1' || echo '0'; }

errexit() { echo "$*" >&2 && exit 1; }

isogram() {
    (( $# == 1 )) || errexit "Usage: "
    local phrase="${1,,}" alpha="'a"
    phrase=${phrase//[^a-z]/}
    local -i charFlag=0
    for (( i=0; i < ${#phrase}; i++ )); do
        local char=${phrase:i:1}
        if [[ $char = [a-z] ]]; then
            local cp="'$char"
            if (( (charFlag & (1 << (cp - alpha))) != 0 )); then
                echo false && exit 0
            fi
            (( charFlag |= 1 << (cp - alpha) ))
        fi
    done
    echo true
}

main() { isogram $1 && exit 0; }

set -e -u && main "$@"
