#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

color_code() {
    case "$1" in 
        black)  echo 0 ;;
        brown)  echo 1 ;;
        red)    echo 2 ;;
        orange) echo 3 ;;
        yellow) echo 4 ;;
        green)  echo 5 ;;
        blue)   echo 6 ;;
        violet) echo 7 ;;
        grey)   echo 8 ;;
        white)  echo 9 ;;
        *) errexit "invalid color band";;
    esac
}

resistor_color_duo() {
    local -i resistance=0
    for color in "${@:1:2}" 
    do 
        band=$(color_code "$color") || errexit "invalid color"
        resistance=$(( 10 * resistance + band ))
    done
    echo "$resistance"
}

main() {
    resistor_color_duo "$@" && exit 0
}

set -e -u && main "$@"
