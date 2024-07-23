#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

darts() {
    [[ -z $1 || -z $2 || $1 != +([-[:digit:].]) || $2 != +([-[:digit:].]) ]] &&
    errexit "Usage: ${0#*} <x> <y>"
    # local x=$1 
    # local y=$2 
    local points=0
    local FORMULA=echo $"sqrt ("$1"**2 + "$2" ** 2)"
    # local c1=echo "$FORMULA <= 1" | bc -l
    # local c5=echo "$FORMULA <= 5" | bc -l 
    # local c10=echo "$FORMULA <= 10" | bc -l
    local r
    $r=$($FORMULA | bc -l)    
    # c1=(( r <= 1 ))
    # c5=(( r <= 5 ))
    # c10=(( r <= 10 ))
    # {
    #     read -r c1
    #     read -r c5
    #     read -r c10
    # } <<< bc -l <<
    #         _SCRIPT_
    #             r = (x ** 2 + y ** 2) ** 0.5
    #             r <= 10
    #             r <= 5
    #             r <= 1
    #         _SCRIPT_   
    # case "$c10$c5$c1" in
    # 1??) points += 1 ;;
    # 11?) points += 4 ;;
    # 111) points += 5 ;;
    # *) points += 0 ;;
    # esac
    [[ $r -le 10 ]] && $points+=1
    [[ $r -le 5 ]] && $points+=4
    [[ $r -le 1 ]] && $points+=5

    echo $points
}

main() {
    darts "$1" "$2" && exit 0
}

set -e -u && main "$@"
