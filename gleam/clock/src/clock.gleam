import gleam/int

pub type Clock {
  Clock(hours: Int, minutes: Int)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  let total_minutes = hour * 60 + minute
  let assert Ok(normalized_minutes) = int.modulo(total_minutes, 24 * 60)
  let hours = normalized_minutes / 60
  let minutes = normalized_minutes % 60
  Clock(hours: hours, minutes: minutes)
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  create(clock.hours, clock.minutes + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  create(clock.hours, clock.minutes - minutes)
}

pub fn display(clock: Clock) -> String {
  to_two_digit_string(clock.hours) <> ":" <> to_two_digit_string(clock.minutes)
}

fn to_two_digit_string(n: Int) -> String {
  case n < 10 {
    True -> "0" <> int.to_string(n)
    False -> int.to_string(n)
  }
}
