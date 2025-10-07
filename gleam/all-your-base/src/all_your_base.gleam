import gleam/bool.{guard}
import gleam/list.{try_fold}
import gleam/result.{try}

pub type Error {
  InvalidBase(Int)
  InvalidDigit(Int)
}

pub fn rebase(
  digits digits: List(Int),
  input_base input_base: Int,
  output_base output_base: Int,
) -> Result(List(Int), Error) {
  use <- guard(input_base < 2, Error(InvalidBase(input_base)))
  use <- guard(output_base < 2, Error(InvalidBase(output_base)))

  use value <- try(to_decimal(digits, input_base))
  Ok(from_decimal(value, output_base))
}

fn to_decimal(digits: List(Int), base: Int) -> Result(Int, Error) {
  digits
  |> try_fold(0, fn(acc, digit) {
    use <- guard(digit < 0 || digit >= base, Error(InvalidDigit(digit)))
    Ok(acc * base + digit)
  })
}

fn from_decimal(n: Int, base: Int) -> List(Int) {
  case n {
    0 -> [0]
    _ -> do_from_decimal(n, base, [])
  }
}

fn do_from_decimal(n: Int, base: Int, acc: List(Int)) -> List(Int) {
  case n {
    0 -> acc
    _ -> do_from_decimal(n / base, base, [n % base, ..acc])
  }
}
