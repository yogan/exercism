import gleam/list
import gleam/string

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  rna
  |> string.to_graphemes
  |> list.sized_chunk(3)
  |> list.map(string.concat)
  |> list.take_while(fn(c) { c != "UAA" && c != "UAG" && c != "UGA" })
  |> list.try_map(fn(codon) {
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
