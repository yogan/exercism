using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand)
    {
        return Translate(strand).ToArray();
    }

    private static IEnumerable<string> Translate(string strand)
    {
        foreach (var codon in GetCodons(strand))
        {
            switch (codon)
            {
                case "AUG":
                    yield return "Methionine";
                    break;
                case "UUU":
                case "UUC":
                    yield return "Phenylalanine";
                    break;
                case "UUA":
                case "UUG":
                    yield return "Leucine";
                    break;
                case "UCU":
                case "UCC":
                case "UCA":
                case "UCG":
                    yield return "Serine";
                    break;
                case "UAU":
                case "UAC":
                    yield return "Tyrosine";
                    break;
                case "UGU":
                case "UGC":
                    yield return "Cysteine";
                    break;
                case "UGG":
                    yield return "Tryptophan";
                    break;
                case "UAA":
                case "UAG":
                case "UGA":
                    yield break;
            }
        }
    }

    private static IEnumerable<string>GetCodons(string strand)
    {
        for (int i = 0; i < strand.Length; i += 3)
        {
            yield return strand.Substring(i, 3);
        }

    }
}
