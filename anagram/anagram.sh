#!/usr/bin/env bash

anagram() {
    local word candidates=() anagrams=""
    word=$( normalized "$1" )
    candidates=($2)
    for i in "${candidates[@]}"
    do
        local candidate=$( normalized $i )
        [[ ${candidate} == ${word} && ${i^^} != ${1^^} ]] && 
        anagrams+="$i "
    done
    echo $anagrams
}

normalized() {
    echo ${1^^} | grep -o . | sort | tr -d "\n"
}

main() {
    anagram "$@" && exit 0
}

set -eu && main "$@"