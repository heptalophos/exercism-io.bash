#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

float_2ble_div() { 
    echo - | awk -v x="$1" -v y="$2" -v z="$3" \
    'BEGIN {printf "%0.2f", x / y / z}'
}

space_age() {
    local -r planet="$1" age="$2"
    readonly oneEarthYear=31557600
    readonly -A orbitalPeriod=(
        [Mercury]=0.2408467
        [Venus]=0.61519726
        [Earth]=1.0
        [Mars]=1.8808158
        [Jupiter]=11.862615
        [Saturn]=29.447498
        [Uranus]=84.016846
        [Neptune]=164.79132
    )
    [[ ! -n ${orbitalPeriod[$planet]} ]] && 
    errexit "Sorry, $planet is not a planet 😄"
    
    printf "%.2f" \
    $(float_2ble_div $age $oneEarthYear ${orbitalPeriod[$planet]})
}

main() {
    space_age "$@" && exit 0
}

set -eo pipefail && main "$@"
