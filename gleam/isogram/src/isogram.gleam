import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  string.lowercase(phrase)
  |> string.to_graphemes
  |> list.filter(is_lowercase_letter)
  |> fn(letters) { letters == list.unique(letters) }
}

fn is_lowercase_letter(c: String) -> Bool {
  let assert [utf] = c |> string.to_utf_codepoints
  let ascii = utf |> string.utf_codepoint_to_int
  ascii >= 97 && ascii <= 122
}
