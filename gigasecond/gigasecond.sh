#!/usr/bin/env bash

main() {
    local -i seconds
    seconds=$(TZ=UTC date -d "$1" "+%s")
    (( seconds += 10 ** 9 ))
    echo $(TZ=UTC date --date="@$seconds" "+%FT%T") && exit 0
}

set -eu && main "$@"