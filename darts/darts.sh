#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

darts() {
    [[ ! $# -eq 2 || $* =~ [[:alpha:]] ]] && errexit "Usage: ${0#*} <x> <y>"
    local sums eucd
    sums=$(awk 'BEGIN { print (ARGV[1] ** 2 + ARGV[2] ** 2) }' "$1" "$2")
    eucd=$(awk 'BEGIN {print (ARGV[1] ** (1.0 / ARGV[2]))}' "$sums" 2)
    local points=0
    if (( $(echo "$eucd <= 10" | bc -l) )); then (( points += 1 )); fi
    if (( $(echo "$eucd <= 5"  | bc -l) )); then (( points += 4 )); fi
    if (( $(echo "$eucd <= 1"  | bc -l) )); then (( points += 5 )); fi
    echo $points
}

main() {
    darts "$1" "$2" && exit 0
}

set -e -u && main "$@"
