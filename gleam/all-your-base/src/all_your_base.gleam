import gleam/bool
import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub type Error {
  InvalidBase(Int)
  InvalidDigit(Int)
}

pub fn rebase(
  digits digits: List(Int),
  input_base input_base: Int,
  output_base output_base: Int,
) -> Result(List(Int), Error) {
  use <- bool.guard(
    when: input_base < 2,
    return: Error(InvalidBase(input_base)),
  )
  use <- bool.guard(
    when: output_base < 2,
    return: Error(InvalidBase(output_base)),
  )

  digits
  |> list.reverse
  |> list.try_fold(#(0, 0), fn(acc, d) {
    case d < 0 || d >= input_base {
      True -> Error(InvalidDigit(d))
      False -> {
        let #(sum, exp) = acc
        Ok(#(sum + d * pow(input_base, exp), exp + 1))
      }
    }
  })
  |> result.map(fn(pair) {
    case pair {
      #(0, _) -> [0]
      #(value, _) -> into_base(value, output_base)
    }
  })
}

fn pow(n: Int, e: Int) -> Int {
  e
  |> int.to_float
  |> int.power(n, _)
  |> result.unwrap(0.0)
  |> float.round
}

fn into_base(n: Int, base: Int) -> List(Int) {
  case n == 0 {
    True -> []
    False -> into_base(n / base, base) |> list.append([n % base])
  }
}
