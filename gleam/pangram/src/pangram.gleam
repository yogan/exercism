import gleam/set
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let alphabet =
    "abcdefghijklmnopqrstuvwxyz"
    |> string.to_graphemes
    |> set.from_list

  sentence
  |> string.lowercase
  |> string.to_graphemes
  |> set.from_list
  |> set.intersection(alphabet)
  |> set.size
  == set.size(alphabet)
}
