import gleam/int
import gleam/list
import gleam/string

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let assert [d4, d3, d2, d1, d0] =
    encoded_message
    |> int.to_base2
    |> string.pad_start(to: 5, with: "0")
    |> string.to_graphemes

  [d0, d1, d2, d3]
  |> list.index_fold([], fn(acc, digit, pos) {
    case digit, pos {
      "1", 0 -> [Wink, ..acc]
      "1", 1 -> [DoubleBlink, ..acc]
      "1", 2 -> [CloseYourEyes, ..acc]
      "1", 3 -> [Jump, ..acc]
      _, _ -> acc
    }
  })
  |> fn(res) {
    case d4 {
      "1" -> res
      _ -> res |> list.reverse
    }
  }
}
