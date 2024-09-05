#!/usr/bin/env bash

scrabble() {
    local -i score=0
    shopt -s nocasematch
    for i in $(seq 0 ${#1}); do
    	case ${1:$i:1} in 
            [AEIOULNRST]) (( score += 1  )) ;;
            [DG])         (( score += 2  )) ;;
            [BCMP])       (( score += 3  )) ;;
            [FHVWY])      (( score += 4  )) ;;
            [K])          (( score += 5  )) ;;
            [JX])         (( score += 8  )) ;;
            [QZ])         (( score += 10 )) ;;
        esac
    done
    echo ${score}
}

main() {
    scrabble "$1" && exit 0
}

set -e -u && main "$@"
