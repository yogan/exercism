import gleam/bool.{guard}
import gleam/int.{compare, sum}
import gleam/list.{filter, range}
import gleam/order.{Eq, Gt, Lt}

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
  case n {
    1 -> [1]
    2 -> [1, 2]
    _ -> [1, ..range(2, n / 2) |> filter(fn(x) { n % x == 0 })]
  }
}
