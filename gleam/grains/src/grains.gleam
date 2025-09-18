import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square {
    n if 0 < n && n < 65 ->
      int.to_float(n - 1)
      |> int.power(2, _)
      |> result.map(float.round)
      |> result.map_error(fn(_) { InvalidSquare })
    _ -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  list.range(1, 64)
  |> list.map(square)
  |> result.all
  |> result.unwrap([])
  |> int.sum
}
