import gleam/int

pub fn convert(number: Int) -> String {
  case number % 3, number % 5, number % 7 {
    0, 0, 0 -> "PlingPlangPlong"
    0, 0, _ -> "PlingPlang"
    0, _, 0 -> "PlingPlong"
    _, 0, 0 -> "PlangPlong"
    0, _, _ -> "Pling"
    _, 0, _ -> "Plang"
    _, _, 0 -> "Plong"
    _, _, _ -> number |> int.to_string()
  }
}
