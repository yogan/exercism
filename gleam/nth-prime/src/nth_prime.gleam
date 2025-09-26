import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub fn prime(number: Int) -> Result(Int, Nil) {
  list.range(2, upper_bound(number)) |> sieve(number, 1)
}

fn sieve(xs: List(Int), nth: Int, cur: Int) -> Result(Int, Nil) {
  case nth == cur {
    True -> xs |> list.first
    False -> {
      case xs {
        [p, ..xs] -> {
          xs |> list.filter(fn(x) { x % p > 0 }) |> sieve(nth, cur + 1)
        }
        _ -> Error(Nil)
      }
    }
  }
}

fn upper_bound(i: Int) -> Int {
  case i < 6 {
    True -> 15
    False -> {
      let n = i |> int.to_float()
      n *. { ln(n) +. ln(ln(n)) } |> float.round
    }
  }
}

fn ln(x: Float) -> Float {
  x |> float.logarithm() |> result.unwrap(0.0)
}
