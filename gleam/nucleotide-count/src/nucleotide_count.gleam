import gleam/dict.{type Dict}
import gleam/list
import gleam/result
import gleam/string

pub fn nucleotide_count(dna: String) -> Result(Dict(String, Int), Nil) {
  dna
  |> string.to_graphemes
  |> list.try_fold(
    dict.from_list([#("A", 0), #("C", 0), #("G", 0), #("T", 0)]),
    fn(dict, letter) {
      use count <- result.try(dict |> dict.get(letter))
      dict |> dict.insert(letter, count + 1) |> Ok
    },
  )
}
