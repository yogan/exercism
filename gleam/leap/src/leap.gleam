pub fn is_leap_year(year: Int) -> Bool {
  case year % 4, year % 100, year % 400 {
    _, _, 0 -> True
    _, 0, _ -> False
    0, _, _ -> True
    _, _, _ -> False
  }
}
