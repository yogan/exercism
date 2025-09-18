import gleam/int
import gleam/list

pub fn scores(high_scores: List(Int)) -> List(Int) {
  high_scores
}

pub fn latest(high_scores: List(Int)) -> Result(Int, Nil) {
  high_scores |> list.last
}

pub fn personal_best(high_scores: List(Int)) -> Result(Int, Nil) {
  high_scores |> list.reduce(int.max)
}

pub fn personal_top_three(high_scores: List(Int)) -> List(Int) {
  high_scores |> list.sort(int.compare) |> list.reverse |> list.take(3)
}
