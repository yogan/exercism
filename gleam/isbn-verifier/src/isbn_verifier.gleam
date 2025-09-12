import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn is_valid(isbn: String) -> Bool {
  let chars = isbn |> string.replace("-", "") |> string.to_graphemes()
  case list.length(chars) {
    10 -> {
      let #(ds, d10) = list.split(chars, 9)
      let ds = ds |> list.map(int.parse) |> result.all()
      case ds {
        Ok(ds) -> {
          let assert [d10] = d10
          let d10 = case d10 {
            "X" -> Ok(10)
            d10 -> int.parse(d10)
          }
          case d10 {
            Ok(d10) -> {
              let assert [d1, d2, d3, d4, d5, d6, d7, d8, d9] = ds
              check_isbn(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10)
            }
            Error(_) -> False
          }
        }
        Error(_) -> False
      }
    }
    _ -> False
  }
}

fn check_isbn(
  d1: Int,
  d2: Int,
  d3: Int,
  d4: Int,
  d5: Int,
  d6: Int,
  d7: Int,
  d8: Int,
  d9: Int,
  d10: Int,
) -> Bool {
  let sum =
    { d1 * 1 + d2 * 2 + d3 * 3 + d4 * 4 + d5 * 5 }
    + { d6 * 6 + d7 * 7 + d8 * 8 + d9 * 9 + d10 * 10 }
  sum % 11 == 0
}
