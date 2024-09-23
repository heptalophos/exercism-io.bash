#!/usr/bin/env bash

reverse() {
    local revstr=""
    for (( i =${#1}; i >= 0; --i )) 
    do
        revstr+="${1:i:1}"
    done
    echo "$revstr"
}

main() {
    reverse "$1" && exit 0
}

set -e -u && main "$@"