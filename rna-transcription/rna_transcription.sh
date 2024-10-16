#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

rna_transcription() {
    local -A complements
    local dna="${*^^}" rna=""
    [[ "$dna" == *[^GCTA]* ]] && errexit "Invalid nucleotide detected."
    complements=([A]=U [C]=G [G]=C [T]=A)
    for i in $( seq 1 ${#dna} )
    do
        nucl=${complements[${dna:i-1:1}]}
        [[ -n nucl ]] && rna+="$nucl"
    done
    echo "$rna"
}

main() {
    rna_transcription "$*" && exit 0
}

set -e -u && main "$@"
