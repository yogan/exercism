import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, is_anagram(word, _))
}

fn is_anagram(target: String, candidate: String) -> Bool {
  let #(target, candidate) = #(
    string.lowercase(target),
    string.lowercase(candidate),
  )

  target != candidate && sorted_chars(target) == sorted_chars(candidate)
}

fn sorted_chars(string: String) -> List(String) {
  string |> string.to_graphemes |> list.sort(string.compare)
}
