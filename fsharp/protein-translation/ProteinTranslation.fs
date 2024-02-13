module ProteinTranslation

let translate codon =
    match codon with
    | "AUG"                         -> Some("Methionine")
    | "UUU" | "UUC"                 -> Some("Phenylalanine")
    | "UUA" | "UUG"                 -> Some("Leucine")
    | "UCU" | "UCC" | "UCA" | "UCG" -> Some("Serine")
    | "UAU" | "UAC"                 -> Some("Tyrosine")
    | "UGU" | "UGC"                 -> Some("Cysteine")
    | "UGG"                         -> Some("Tryptophan")
    | "UAA" | "UAG" | "UGA"         -> None
    | _ -> invalidArg "codon" (codon + " is not a valid codon")

let proteins rna =
    rna
        |> Seq.chunkBySize 3
        |> Seq.map System.String
        |> Seq.map translate
        |> Seq.takeWhile (fun x -> x.IsSome)
        |> Seq.map (fun x -> x.Value)
        |> Seq.toList
