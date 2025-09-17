import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  dict.fold(legacy, dict.new(), fn(acc, points, chars) {
    list.fold(chars, acc, fn(acc, c) {
      dict.insert(acc, string.lowercase(c), points)
    })
  })
}
