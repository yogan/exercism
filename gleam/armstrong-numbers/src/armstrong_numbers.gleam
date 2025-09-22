import gleam/int
import gleam/list
import gleam/string

pub fn is_armstrong_number(number: Int) -> Bool {
  let len = number |> int.to_string |> string.length
  let sum = digits(number) |> list.map(pow(_, len)) |> int.sum

  sum == number
}

fn digits(n: Int) -> List(Int) {
  case n {
    n if n < 10 -> [n]
    _ -> [n % 10, ..digits(n / 10)]
  }
}

fn pow(n: Int, e: Int) -> Int {
  case e {
    0 -> 1
    1 -> n
    _ -> n * pow(n, e - 1)
  }
}
