#!/usr/bin/env bash

main() {
    local name=${1:-you}
    echo "One for $name, one for me."
    return 0
}

main "$@"
