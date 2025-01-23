#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

boolRC () { (( $? == 0 )) && echo true || echo false; }

isogram() {
    # (( $# == 1 )) || errexit "Usage: "
    # local phrase="${1,,}" alpha=97
    # phrase=${phrase//[^a-z]/}
    # local -i charFlag=0
    # for (( i=0; i < ${#phrase}; i++ )); do
    #     local char=${phrase:i:1}
    #     if [[ $char = [a-z] ]]; then 
    #         local mask=$(( 1 << $char - $alpha ))
    #         if (( (charFlag & 1 << (cp - $alpha)) != 0 )); then
    #             echo false && exit 0
    #         fi
    #         (( charFlag |= 1 << ("$cp" - "$alpha") ))
    #     fi
    # done
    # echo true
    (( $# == 1 )) || exit 1
    local -A found  # track discovered letters
    local -i i  # loop counter
    local word=${1,,}  # lowercased word
    for (( i = 0; i < ${#word}; i++ )); do
        chr="${word:$i:1}"
        [[ $chr = [[:alpha:]] ]] || continue
        [[ -v found[$chr] ]] && return 1 || found[$chr]=''
    done
}

main() { isogram $1; boolRC && exit 0; }

set -e -u && main "$@"
