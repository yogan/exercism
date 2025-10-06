import gleam/list
import gleam/result
import gleam/string

pub fn abbreviate(phrase phrase: String) -> String {
  phrase
  |> string.replace("_", "")
  |> string.replace("-", " ")
  |> string.split(" ")
  |> list.map(string.first)
  |> result.values
  |> string.concat
  |> string.uppercase
}
