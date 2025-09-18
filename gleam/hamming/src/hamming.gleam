import gleam/list
import gleam/result
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  use list_of_pairs <- result.map(list.strict_zip(
    string.to_graphemes(strand1),
    string.to_graphemes(strand2),
  ))

  list_of_pairs
  |> list.filter(fn(pair) { pair.0 != pair.1 })
  |> list.length
}
