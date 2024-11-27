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

resistance() {
    band1=$(color_code "$1") || errexit "invalid color"
    band2=$(color_code "$2") || errexit "invalid color"
    echo $(( 10 * band1 + band2 ))
}

main() {
    resistance "$@" && exit 0
}

set -e -u && main "$@"