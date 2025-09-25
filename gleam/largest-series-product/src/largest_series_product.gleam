import gleam/bool
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn largest_product(digits: String, span: Int) -> Result(Int, Nil) {
  use <- bool.guard(when: span == 0, return: Ok(1))

  digits
  |> string.to_graphemes
  |> list.map(int.parse)
  |> result.all
  |> result.map(fn(numbers) {
    numbers
    |> list.window(span)
    |> list.map(product)
    |> list.reduce(int.max)
  })
  |> result.flatten
}

fn product(numbers: List(Int)) -> Int {
  numbers
  |> list.reduce(fn(x, y) { x * y })
  |> result.unwrap(0)
}
