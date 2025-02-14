#!/usr/bin/env bash

alphabet_size=26
lowercase_offset=97
uppercase_offset=65

is_lowercase () {
    (( lowercase_offset <= ascii && ascii < lowercase_offset + alphabet_size ))
}

is_uppercase () {
    (( uppercase_offset <= ascii && ascii < uppercase_offset + alphabet_size ))
}

rotate () {
    local symbol="$1"
    local ascii
    ascii=$(printf '%d' "'$symbol")
    local case_offset
    if is_uppercase; then
        case_offset=uppercase_offset
    elif is_lowercase; then
        case_offset=lowercase_offset
    else
        printf '%s' "$symbol"
        return
    fi
    (( ascii+=offset ))
    (( ascii-=case_offset ))
    (( ascii%=alphabet_size ))
    (( ascii+=case_offset ))
    printf '%b' "$(printf '\\x%x' "$ascii")"
}

rot_cipher () {
    local input="$1"
    local offset="$2"
    local cipher=''
    for (( i=0; i<${#input}; i++ )); do
        cipher+=$(rotate "${input:$i:1}")
    done
    echo "$cipher"
}


main() {
    rot_cipher "$@" && exit 0
}

set -e && main $@



