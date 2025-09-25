import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  check(value |> string.to_graphemes, [])
}

fn check(input: List(String), stack: List(String)) -> Bool {
  case input {
    [] -> stack |> list.is_empty
    [c, ..rest] ->
      case c {
        "(" -> check(rest, [")", ..stack])
        "[" -> check(rest, ["]", ..stack])
        "{" -> check(rest, ["}", ..stack])
        cp if cp == ")" || cp == "]" || cp == "}" -> {
          case stack |> list.first == Ok(cp) {
            True -> check(rest, stack |> list.drop(1))
            False -> False
          }
        }
        _ -> check(rest, stack)
      }
  }
}
