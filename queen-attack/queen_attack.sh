#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

validate_board() {
    local -i wrank bfile brank bfile
    wrank="$1"; wfile="$2"; brank="$3"; bfile="$4"
    (( wrank < 0 || brank < 0 )) && errexit "row not positive"
    (( wrank > 7 || brank > 7 )) && errexit "row not on board"
    (( wfile < 0 || bfile < 0 )) && errexit "column not positive"
    (( wfile > 7 || bfile > 7 )) && errexit "column not on board"
    (( wrank == brank && wfile == bfile )) && errexit "same position"
}

queen_attack() {
    [[ $1 == "$3" || $1 != "-w"  || $3 != "-b" ]] &&
    errexit "Usage: ${0#*} -w <rank>,<file> -b <rank>,<file>"

    local -i wrank wfile brank bfile drank dfile
    IFS=, read -r wrank wfile <<< "$2"
    IFS=, read -r brank bfile <<< "$4"
    validate_board $wrank $wfile $brank $bfile
    drank=$(( wrank-brank < 0 ? brank-wrank : wrank-brank ))
    dfile=$(( wfile-bfile < 0 ? bfile-wfile : wfile-bfile ))
    (( drank * dfile == 0 || drank / dfile == 1 )) && echo true || echo false
}

main() { queen_attack "$@" && exit 0; }

set -e -u && main "$@"
