pub fn convert(number: Int) -> String {
  helper(number, values, "")
}

fn helper(number: Int, mapping: List(#(Int, String)), acc: String) -> String {
  case mapping {
    [] -> acc
    [#(value, symbols), ..rest] -> {
      case number >= value {
        True -> helper(number - value, mapping, acc <> symbols)
        False -> helper(number, rest, acc)
      }
    }
  }
}

const values = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I"),
]
