import gleam/list
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  case string.length(strand1) == string.length(strand2) {
    True ->
      list.zip(string.to_graphemes(strand1), string.to_graphemes(strand2))
      |> list.filter(fn(pair) { pair.0 != pair.1 })
      |> list.length
      |> Ok
    False -> Error(Nil)
  }
}
