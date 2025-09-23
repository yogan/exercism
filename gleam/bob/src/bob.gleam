import gleam/bool
import gleam/list
import gleam/string

pub fn hey(remark: String) -> String {
  use <- bool.guard(when: is_silence(remark), return: "Fine. Be that way!")

  case is_yelled(remark), is_question(remark) {
    True, True -> "Calm down, I know what I'm doing!"
    False, True -> "Sure."
    True, False -> "Whoa, chill out!"
    False, False -> "Whatever."
  }
}

fn is_silence(string: String) -> Bool {
  string |> keep_letters_and_punctuation |> string.is_empty
}

fn is_yelled(string: String) -> Bool {
  string |> keep_letters |> string.is_empty == False
  && string == string |> string.uppercase
}

fn is_question(string: String) -> Bool {
  string |> string.trim |> string.ends_with("?")
}

fn keep_letters(string: String) -> String {
  filter(string, is_letter)
}

fn keep_letters_and_punctuation(string: String) -> String {
  filter(string, is_letter_number_or_punctuation)
}

fn is_letter(code: Int) -> Bool {
  is_lowercase_letter(code) || is_uppercase_letter(code)
}

fn is_letter_number_or_punctuation(code: Int) -> Bool {
  is_letter(code) || is_number(code) || is_punctuation(code)
}

fn is_lowercase_letter(code: Int) -> Bool {
  code >= 97 && code <= 122
}

fn is_uppercase_letter(code: Int) -> Bool {
  code >= 65 && code <= 90
}

fn is_number(code: Int) -> Bool {
  code >= 48 && code <= 57
}

fn is_punctuation(code: Int) -> Bool {
  //      !             .             ?
  code == 33 || code == 46 || code == 63
}

fn filter(string: String, predicate: fn(Int) -> Bool) -> String {
  string
  |> string.to_utf_codepoints
  |> list.map(string.utf_codepoint_to_int)
  |> list.filter(predicate)
  |> list.map(to_utf_codepoint)
  |> string.from_utf_codepoints
}

fn to_utf_codepoint(code: Int) -> UtfCodepoint {
  let assert Ok(codepoint) = string.utf_codepoint(code)
  codepoint
}
