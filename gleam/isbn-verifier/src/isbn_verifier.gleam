import gleam/bool
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn is_valid(isbn: String) -> Bool {
  let chars = isbn |> string.replace("-", "") |> string.to_graphemes()

  use <- bool.guard(list.length(chars) != 10, False)
  let assert #(ds, [d10]) = list.split(chars, 9)

  validate(ds, d10) |> result.unwrap(False)
}

fn validate(ds: List(String), d10: String) -> Result(Bool, Nil) {
  use ds <- result.try(ds |> list.map(int.parse) |> result.all())
  use d10 <- result.try(d10 |> string.replace("X", "10") |> int.parse())

  ds |> list.append([d10]) |> check_isbn() |> Ok
}

fn check_isbn(ds: List(Int)) -> Bool {
  ds
  |> list.index_map(fn(d, i) { d * { i + 1 } })
  |> int.sum()
  |> fn(sum) { sum % 11 == 0 }
}
