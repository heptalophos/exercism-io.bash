#!/usr/bin/env bash

boolx() { (( $1 == 0 )) && echo 't' || echo 'f'; }
silent() { [[ -z "$1" ]]; boolx $?; }
question() { [[ "$1" == *"?" ]]; boolx $?; }
yelling() {
    local upper=${1^^} lower=${1,,}
    [[ "$upper" = "$1" && "$upper" != "$lower" ]]
    boolx $?
}
bob() {
    read -d '' query <<< "$(sed 's/[\r]//gi' <<< ${1:-})"
    local s=$(silent "$query") y=$(yelling "$query") 
          q=$(question "$query")
    case "${s}${y}${q}" in
    "fft") echo "Sure." ;;
    "ftf") echo "Whoa, chill out!" ;;
    "ftt") echo "Calm down, I know what I'm doing!" ;;
    "tff") echo "Fine. Be that way!" ;;
    *) echo "Whatever." ;;
    esac
}

main() {
    bob "$@" && exit 0
}

set -e -u && main "$@"
