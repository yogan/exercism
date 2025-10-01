import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

const kilo = 1000

const mega = 1_000_000

const giga = 1_000_000_000

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  colors
  |> list.take(3)
  |> list.map(color_value)
  |> result.all
  |> result.try(fn(values) {
    case values {
      [tens, ones, zeros] -> {
        case { tens * 10 + ones } * pow10(zeros) {
          v if v >= giga -> Resistance(value: v / giga, unit: "gigaohms")
          v if v >= mega -> Resistance(value: v / mega, unit: "megaohms")
          v if v >= kilo -> Resistance(value: v / kilo, unit: "kiloohms")
          v -> Resistance(value: v, unit: "ohms")
        }
        |> Ok
      }
      _ -> Error(Nil)
    }
  })
}

fn pow10(n: Int) -> Int {
  int.power(10, int.to_float(n)) |> result.unwrap(0.0) |> float.round
}

fn color_value(color: String) -> Result(Int, Nil) {
  case color {
    "black" -> Ok(0)
    "brown" -> Ok(1)
    "red" -> Ok(2)
    "orange" -> Ok(3)
    "yellow" -> Ok(4)
    "green" -> Ok(5)
    "blue" -> Ok(6)
    "violet" -> Ok(7)
    "grey" -> Ok(8)
    "white" -> Ok(9)
    _ -> Error(Nil)
  }
}
