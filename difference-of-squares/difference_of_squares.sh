#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

square_of_sum() {
    local -i sum=0
    for (( i=1; i <= $1; i++)) 
    do
        (( sum += $i )) 
    done
    echo "$(( sum ** 2 ))"
}

sum_of_squares() {
    local -i sum=0
    for (( i=1; i <= $1; i++)) 
    do
        (( sum += i**2 ))
    done
    echo "$(( sum ))"
}

difference() {
    diff=$(( $(square_of_sum $1) - $(sum_of_squares $1) ))
    echo "$(( diff ))"
}

differenceSquares() {
    case $1 in
    difference | sum_of_squares | square_of_sum)
        echo "$( $1 $2 )" ;;
    *) 
        errexit "invalid argument: $1" ;;
    esac
}

main() {
    differenceSquares "$@" && exit 0
}

set -e -u && main "$@"