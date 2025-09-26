import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  use row <- result.try(string |> string.split("\n") |> nth(index))
  row |> string.split(" ") |> list.map(int.parse) |> result.all
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  use digits <- result.try(
    string
    |> string.split("\n")
    |> list.map(fn(row) { row |> string.split(" ") |> nth(index) })
    |> result.all,
  )

  digits |> list.map(int.parse) |> result.all
}

fn nth(list: List(a), index: Int) -> Result(a, Nil) {
  list |> list.drop(index - 1) |> list.first
}
