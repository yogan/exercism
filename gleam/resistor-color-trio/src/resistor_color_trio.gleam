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

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  colors
  |> list.take(3)
  |> list.map(fn(color) { color_values |> list.key_find(color) })
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
  int.power(10, int.to_float(n)) |> result.unwrap(0.0) |> float.round
}
