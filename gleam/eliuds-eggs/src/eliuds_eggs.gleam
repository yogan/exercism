pub fn egg_count(number: Int) -> Int {
  case number, number % 2 {
    0, _ -> 0
    _, 0 -> egg_count(number / 2)
    _, _ -> egg_count(number / 2) + 1
  }
}
