import gleam/list
import gleam/string

pub fn abbreviate(phrase phrase: String) -> String {
  phrase
  |> string.replace("_", "")
  |> string.replace("-", " ")
  |> string.split(" ")
  |> list.map(fn(word) {
    case word |> string.pop_grapheme {
      Ok(#(c, _)) -> c |> string.uppercase
      _ -> ""
    }
  })
  |> string.concat
}
