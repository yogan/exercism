import gleam/list
import gleam/string

pub fn encode(phrase: String) -> String {
  phrase
  |> string.to_graphemes
  |> list.filter(fn(c) { !string.contains(" .,!?", c) })
  |> list.map(swap_char)
  |> list.sized_chunk(5)
  |> list.map(string.concat)
  |> string.join(" ")
}

pub fn decode(phrase: String) -> String {
  phrase
  |> string.to_graphemes
  |> list.filter(fn(c) { c != " " })
  |> list.map(swap_char)
  |> string.concat
}

fn swap_char(c: String) -> String {
  case c |> string.lowercase {
    "a" -> "z"
    "b" -> "y"
    "c" -> "x"
    "d" -> "w"
    "e" -> "v"
    "f" -> "u"
    "g" -> "t"
    "h" -> "s"
    "i" -> "r"
    "j" -> "q"
    "k" -> "p"
    "l" -> "o"
    "m" -> "n"
    "n" -> "m"
    "o" -> "l"
    "p" -> "k"
    "q" -> "j"
    "r" -> "i"
    "s" -> "h"
    "t" -> "g"
    "u" -> "f"
    "v" -> "e"
    "w" -> "d"
    "x" -> "c"
    "y" -> "b"
    "z" -> "a"
    _ -> c
  }
}
