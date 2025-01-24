#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

ord() { LC_CTYPE=C printf '%d' "'$1"; }

isogram() {
    local -i alpha=$(ord a) flag=0
    local phrase=${1,,}
    for (( i=0; i < ${#phrase}; ++i )); do
        char=${phrase:$i:1}
        [[ ${char//[^a-z]} == "" ]] && continue
        cp=$(ord "$char")
        (( (flag & 1 << (cp - alpha)) )) && echo false && exit 0
        (( flag |= 1 << (cp - alpha) ))
    done
    echo true
}

main() {
    [[ $# != 1 ]] && 
    errexit "Usage: ${0#*} string_with_possible_spaces_or_punctuations"
    isogram $@ && exit 0 
}
# set -x
set -e && main "$@"
