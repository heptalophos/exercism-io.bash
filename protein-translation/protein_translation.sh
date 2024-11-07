#!/usr/bin/env bash

errexit() { echo "$*" >&2 && exit 1; }

protein_translate() {
    local rna codon protein
    local -a proteins=
    local -rA codons_map=(
        [AUG]=Methionine
        [UUU]=Phenylalanine [UUC]=Phenylalanine
        [UUA]=Leucine [UUG]=Leucine
        [UCU]=Serine [UCC]=Serine [UCA]=Serine [UCG]=Serine
        [UAU]=Tyrosine [UAC]=Tyrosine
        [UGU]=Cysteine [UGC]=Cysteine
        [UGG]=Tryptophan
        [UAA]=STOP [UAG]=STOP [UGA]=STOP
    )
    rna="$1"
    proteins=()
    while [[ -n $rna ]]
    do
        codon=${rna:0:3}
        protein=${codons_map[$codon]}
        [[ -n $protein ]] || errexit "Invalid codon"
        [[ $protein == STOP ]] && break
        proteins+=($protein)
        rna=${rna:3}
    done
    printf '%s' "${proteins[*]}"
}

main() { protein_translate "$1" && exit 0; }

set -e && main "$@"
