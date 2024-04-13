pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn preparation_time_in_minutes(number_of_layers: Int) -> Int {
  2 * number_of_layers
}

pub fn elapsed_time_in_minutes(
  number_of_layers: Int,
  elapsed_minutes: Int,
) -> Int {
  preparation_time_in_minutes(number_of_layers) + elapsed_minutes
}

pub fn remaining_minutes_in_oven(elapsed_minutes: Int) -> Int {
  expected_minutes_in_oven() - elapsed_minutes
}

pub fn total_time_in_minutes(number_of_layers: Int, elapsed_minutes: Int) -> Int {
  preparation_time_in_minutes(number_of_layers) + elapsed_minutes
}

pub fn alarm() -> String {
  "Ding!"
}
