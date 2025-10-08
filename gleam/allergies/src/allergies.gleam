import gleam/int
import gleam/list

pub type Allergen {
  Eggs
  Peanuts
  Shellfish
  Strawberries
  Tomatoes
  Chocolate
  Pollen
  Cats
}

pub fn allergic_to(allergen: Allergen, score: Int) -> Bool {
  case allergen {
    Eggs -> int.bitwise_and(score, 1)
    Peanuts -> int.bitwise_and(score, 2)
    Shellfish -> int.bitwise_and(score, 4)
    Strawberries -> int.bitwise_and(score, 8)
    Tomatoes -> int.bitwise_and(score, 16)
    Chocolate -> int.bitwise_and(score, 32)
    Pollen -> int.bitwise_and(score, 64)
    Cats -> int.bitwise_and(score, 128)
  }
  > 0
}

pub fn list(score: Int) -> List(Allergen) {
  [
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
  ]
  |> list.filter(allergic_to(_, score))
}
