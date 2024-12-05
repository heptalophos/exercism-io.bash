#!/usr/bin/env bash

usage() {
    echo "Usage: ${0#*} [hours] [minutes] <[+|-] [extra minutes]> " >&2
}

errexit() { usage; echo "$1" >&2; exit 1; }

clock() {
    (( "$#" != 2 && "$#" != 4 )) && errexit "Error: invalid arguments"
    local rex
    rex='[^[:digit:]\ +-]'
    [[ "$1" =~ $rex || "$2" =~ $rex || "$4" =~ $rex ]] && 
    errexit "Error: invalid arguments"
    [[ -n "$3" && "$3" != [+-] ]] && errexit "Error: invalid arguments"
    local -i mins
    mins=$(( (60*$1 + $2 $3 $4) % 1440 ))
    (( mins < 0 )) && (( mins+=1440 ))
    printf "%02d:%02d\n" $(( mins / 60 )) $(( mins % 60 ))
}

main() {
    clock "$@" && exit 0
}

set -e && main "$@"
