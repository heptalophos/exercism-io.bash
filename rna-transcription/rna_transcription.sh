#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

rna_transcription() {
    [[ "$@" == *[^GCTA]* ]] && 
    errexit "Invalid nucleotide detected."
    local -A complements
    local dna rna
    complements=([A]=U [C]=G [G]=C [T]=A)
    dna="${@^^}"; rna=""
    for i in $( seq 1 ${#dna} )
    do
        nucl=${complements[${dna:i-1:1}]}
        [[ -n nucl ]] && rna+="$nucl"
    done
    echo "$rna"
}

main() {
    rna_transcription "$@" && exit 0
}

set -e -u && main "$@"
