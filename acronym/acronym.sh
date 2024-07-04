#!/usr/bin/env bash

acronym () {
    local -a ws
    IFS=' -_*' read -r -a ws <<<"${1^^}"
    for w in "${ws[@]^}"
    do
        echo -n "${w:0:1}"
    done <<< "${ws[@]^}"
}

set -e -u

acronym "$@"
