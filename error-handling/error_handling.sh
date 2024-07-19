#!/usr/bin/env bash

error_handling() {
    case $# in
    1) echo "Hello, $1";;
    *) echo >&2 "Usage: ${0#*} <person>" && exit 1;;
    esac
}

main() {
    error_handling "$@" && exit 0
}

set -e -u && main "$@"
