#!/usr/bin/env bash

errexit() { 
    echo "$*" >&2 && exit 1 
} 

readonly -a character=(strength dexterity constitution 
                       intelligence wisdom charisma)

ability() {
    local -i roll minroll=6 sum=0
    for _ in seq 1 1 4 
    do
        roll=$(( 1 + $RANDOM % 6 ))
        ((roll < minroll)) && minroll=$roll
        (( sum += roll ))
    done
    echo $(( sum - minroll ))
}

modifier() {
    local -i value=$1
    (( $value % 2 )) && (( --value ))
    echo $(( (value - 10) / 2 ))
}

generate() {
    local attribute value
    for attribute in "${character[@]}"
    do
        value=$(ability)
        echo "${attribute} $value"
        if [[ $attribute == constitution ]]
        then 
            echo "hitpoints $(( 10 + $(modifier "$value")))"
        fi
    done
}
dndCharacter() {
    case "$1" in
    modifier) modifier "$2";; 
    generate) generate;;
    *) errexit "Usage: ${0##*/} <generate|modifier> <?score>";;
    esac
}

main() {
    dndCharacter "$@" && exit 0
}

set -e -u && main "$@"
