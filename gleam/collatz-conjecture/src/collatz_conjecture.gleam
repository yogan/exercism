pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number > 0 {
    True -> Ok(collatz(number, 0))
    False -> Error(NonPositiveNumber)
  }
}

fn collatz(n, steps) -> Int {
  case n {
    1 -> steps
    _ ->
      case n % 2 {
        0 -> collatz(n / 2, steps + 1)
        _ -> collatz(n * 3 + 1, steps + 1)
      }
  }
}
