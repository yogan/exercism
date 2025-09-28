import gleam/list.{map, sized_chunk, take_while, try_map}
import gleam/string.{concat, to_graphemes}

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  rna
  |> to_graphemes
  |> sized_chunk(3)
  |> map(concat)
  |> take_while(fn(c) { c != "UAA" && c != "UAG" && c != "UGA" })
  |> try_map(fn(codon) {
    case codon {
      "AUG" -> Ok("Methionine")
      "UUU" | "UUC" -> Ok("Phenylalanine")
      "UUA" | "UUG" -> Ok("Leucine")
      "UCU" | "UCC" | "UCA" | "UCG" -> Ok("Serine")
      "UAU" | "UAC" -> Ok("Tyrosine")
      "UGU" | "UGC" -> Ok("Cysteine")
      "UGG" -> Ok("Tryptophan")
      _ -> Error(Nil)
    }
  })
}
