import gleam/bool.{guard}
import gleam/float
import gleam/int.{compare, sum, to_float}
import gleam/list.{filter, fold, range}
import gleam/order.{Eq, Gt, Lt}
import gleam/result

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  use <- guard(when: number <= 0, return: Error(NonPositiveInt))
  use <- guard(when: number <= 2, return: Ok(Deficient))

  case factors(number) |> sum |> compare(number) {
    Eq -> Perfect
    Gt -> Abundant
    Lt -> Deficient
  }
  |> Ok
}

fn factors(n: Int) -> List(Int) {
  range(2, sqrt(n))
  |> filter(fn(x) { n % x == 0 })
  |> fold([], fn(acc, x) {
    case x * x == n {
      True -> [x, ..acc]
      False -> [x, n / x, ..acc]
    }
  })
  |> list.append([1])
}

fn sqrt(n: Int) -> Int {
  n
  |> to_float
  |> float.square_root
  |> result.unwrap(0.0)
  |> float.truncate
}
