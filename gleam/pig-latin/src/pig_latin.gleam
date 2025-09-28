import gleam/list.{contains, map, reverse}
import gleam/string.{
  concat, drop_start, join, length, split, starts_with, to_graphemes,
}

pub fn translate(phrase: String) -> String {
  phrase
  |> split(" ")
  |> map(translate_word)
  |> join(" ")
}

fn translate_word(word: String) -> String {
  case starts_with_vowel_sound(word) {
    True -> word <> "ay"
    False -> {
      let cluster = extract_consonant_cluster(word)
      let rest = drop_start(word, length(cluster))
      rest <> cluster <> "ay"
    }
  }
}

fn starts_with_vowel_sound(word: String) -> Bool {
  starts_with(word, "a")
  || starts_with(word, "e")
  || starts_with(word, "i")
  || starts_with(word, "o")
  || starts_with(word, "u")
  || starts_with(word, "xr")
  || starts_with(word, "yt")
}

fn extract_consonant_cluster(word: String) -> String {
  word
  |> to_graphemes
  |> extract([])
  |> reverse
  |> concat
}

fn extract(graphemes: List(String), acc: List(String)) -> List(String) {
  case graphemes {
    [] -> acc
    [first, ..rest] -> {
      case is_vowel(first) {
        True -> acc
        False -> {
          case first {
            "y" -> {
              case acc {
                [] -> extract(rest, [first, ..acc])
                _ -> acc
              }
            }
            "q" -> {
              case rest {
                ["u", ..remaining] -> extract(remaining, ["u", "q", ..acc])
                _ -> extract(rest, [first, ..acc])
              }
            }
            _ -> extract(rest, [first, ..acc])
          }
        }
      }
    }
  }
}

fn is_vowel(letter: String) -> Bool {
  contains(["a", "e", "i", "o", "u"], letter)
}
