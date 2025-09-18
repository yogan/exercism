import gleam/int
import gleam/list
import gleam/string

pub fn recite(start_verse start_verse: Int, end_verse end_verse: Int) -> String {
  list.range(start_verse, end_verse)
  |> list.map(verse)
  |> string.join("\n")
}

fn verse(n) -> String {
  "This is the " <> phrase(n)
}

fn phrase(n) -> String {
  case n {
    1 -> "house that Jack built."
    2 -> "malt that lay in the " <> phrase(n - 1)
    3 -> "rat that ate the " <> phrase(n - 1)
    4 -> "cat that killed the " <> phrase(n - 1)
    5 -> "dog that worried the " <> phrase(n - 1)
    6 -> "cow with the crumpled horn that tossed the " <> phrase(n - 1)
    7 -> "maiden all forlorn that milked the " <> phrase(n - 1)
    8 -> "man all tattered and torn that kissed the " <> phrase(n - 1)
    9 -> "priest all shaven and shorn that married the " <> phrase(n - 1)
    10 -> "rooster that crowed in the morn that woke the " <> phrase(n - 1)
    11 -> "farmer sowing his corn that kept the " <> phrase(n - 1)
    12 ->
      "horse and the hound and the horn that belonged to the " <> phrase(n - 1)
    _ -> panic as { "no phrase for verse #" <> int.to_string(n) }
  }
}
