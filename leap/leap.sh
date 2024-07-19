#!/usr/bin/env bash

boolx() { [[ "$*" == 0 ]] && echo false || echo true; }
errexit() { echo "$*" >&2 && exit 1; }

leap() {
    [[ "$#" -ne 1 || "$1" =~ [^0-9] ]] && 
    errexit "Usage: "${0#*}" <year>"
    if (( "$1" % 100 == 0 )); then 
        boolx $(( "$1" % 400 == 0 ))
    else
        boolx $(( "$1" % 4 == 0 ))
    fi
}

main() {
    leap "$@" && exit 0
}

set -u -e && main "$@"