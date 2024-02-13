using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand) =>
        GetCodons(strand)
            .Select(ToProtein)
            .TakeWhile(protein => protein != null)
            .ToArray();

    private static string ToProtein(string codon) =>
        codon switch
        {
            "AUG" => "Methionine",
            "UUU" or "UUC" => "Phenylalanine",
            "UUA" or "UUG" => "Leucine",
            "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
            "UAU" or "UAC" => "Tyrosine",
            "UGU" or "UGC" => "Cysteine",
            "UGG" => "Tryptophan",
            "UAA" => null,
            "UAG" => null,
            "UGA" => null,
            _ => throw new System.ArgumentException("Invalid codon")
        };

    private static IEnumerable<string> GetCodons(string strand)
    {
        for (int i = 0; i < strand.Length; i += 3)
        {
            yield return strand.Substring(i, 3);
        }

    }
}
