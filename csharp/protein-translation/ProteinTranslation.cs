using System.Linq;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand) =>
        strand
            .Chunk(3)
            .Select(s => string.Concat(s))
            .Select(ToProtein)
            .TakeWhile(protein => protein != null)
            .ToArray();

    private static string ToProtein(string codon) =>
        codon switch
        {
            "AUG"                            => "Methionine",
            "UUU" or "UUC"                   => "Phenylalanine",
            "UUA" or "UUG"                   => "Leucine",
            "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
            "UAU" or "UAC"                   => "Tyrosine",
            "UGU" or "UGC"                   => "Cysteine",
            "UGG"                            => "Tryptophan",
            "UAA" or "UAG" or "UGA"          => null,
            _ => throw new System.ArgumentException("Invalid codon")
        };
}
