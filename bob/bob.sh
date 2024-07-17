#!/usr/bin/env bash

boolx() { (( $1 == 0 )) && echo '1' || echo '0'; }
silent() { [[ -z "$1" ]]; boolx $?; }
question() { [[ "$1" == *"?" ]]; boolx $?; }
yelling() {
    local upper=${1^^} lower=${1,,}
    [[ "$upper" = "$1" && "$upper" != "$lower" ]]
    boolx $?
}
bob() {
    read -d '' qry <<< "$(sed 's/[\r]//gi' <<< ${1:-})"
    case "$(silent "$qry")$(yelling "$qry")$(question "$qry")" in
    "001") echo "Sure." ;;
    "010") echo "Whoa, chill out!" ;;
    "011") echo "Calm down, I know what I'm doing!" ;;
    "100") echo "Fine. Be that way!" ;;
    *) echo "Whatever." ;;
    esac
}

main() {
    bob "$@" && exit 0
}

set -e -u && main "$@"
