#!/usr/bin/env bash

reverse() {
    local revstr=""
    for i in $( seq ${#1} -1 1 ) 
    do
        revstr+=${1:i-1:1}
    done
    echo "$revstr"
}

main() {
    reverse "$1" && exit 0
}

set -e -u && main "$@"