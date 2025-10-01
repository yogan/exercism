import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  colors
  |> list.take(3)
  |> list.map(list.key_find(color_values, _))
  |> result.all
  |> result.map(fn(values) {
    let assert [tens, ones, zeros] = values
    case { tens * 10 + ones } * pow10(zeros) {
      v if v >= giga -> Resistance(value: v / giga, unit: "gigaohms")
      v if v >= mega -> Resistance(value: v / mega, unit: "megaohms")
      v if v >= kilo -> Resistance(value: v / kilo, unit: "kiloohms")
      v -> Resistance(value: v, unit: "ohms")
    }
  })
}

fn pow10(n: Int) -> Int {
  n
  |> int.to_float
  |> int.power(10, _)
  |> result.unwrap(0.0)
  |> float.round
}

const kilo = 1000

const mega = 1_000_000

const giga = 1_000_000_000

const color_values = [
  #("black", 0),
  #("brown", 1),
  #("red", 2),
  #("orange", 3),
  #("yellow", 4),
  #("green", 5),
  #("blue", 6),
  #("violet", 7),
  #("grey", 8),
  #("white", 9),
]
