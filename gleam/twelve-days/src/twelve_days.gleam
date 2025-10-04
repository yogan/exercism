import gleam/list
import gleam/string

pub fn lyrics(from starting_verse: Int, to ending_verse: Int) -> String {
  list.range(starting_verse, ending_verse)
  |> list.map(verse)
  |> string.join("\n")
}

pub fn verse(number: Int) -> String {
  "On the "
  <> day(number)
  <> " day of Christmas my true love gave to me: "
  <> items(number)
  <> "."
}

fn day(number: Int) -> String {
  case number {
    1 -> "first"
    2 -> "second"
    3 -> "third"
    4 -> "fourth"
    5 -> "fifth"
    6 -> "sixth"
    7 -> "seventh"
    8 -> "eighth"
    9 -> "ninth"
    10 -> "tenth"
    11 -> "eleventh"
    12 -> "twelfth"
    _ -> panic as "invalid day"
  }
}

fn items(number: Int) -> String {
  let inventory = [
    "and a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming",
  ]

  case number {
    1 -> ["a Partridge in a Pear Tree"]
    _ -> inventory |> list.take(number) |> list.reverse
  }
  |> string.join(", ")
}
