import gleam/string

pub fn recite(inputs: List(String)) -> String {
  case inputs {
    [] -> ""
    [last, ..] -> aux(last, inputs) |> string.join("\n")
  }
}

fn aux(last: String, rest: List(String)) -> List(String) {
  case rest {
    [x, y, ..rest] -> [
      "For want of a " <> x <> " the " <> y <> " was lost.",
      ..aux(last, [y, ..rest])
    ]
    _ -> ["And all for the want of a " <> last <> "."]
  }
}
