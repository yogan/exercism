import gleam/int
import gleam/list
import gleam/set

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.flat_map(multiples_up_to(_, limit))
  |> set.from_list
  |> set.to_list
  |> int.sum
}

fn multiples_up_to(n: Int, limit: Int) -> List(Int) {
  case n {
    n if n < 1 -> []
    _ -> list.range(1, limit - 1) |> list.filter(fn(x) { x % n == 0 })
  }
}
