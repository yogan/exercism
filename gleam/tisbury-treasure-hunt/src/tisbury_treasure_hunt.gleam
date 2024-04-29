import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let place = place_location_to_treasure_location(place.1)
  list.filter(treasures, fn(treasure) { treasure.1 == place })
  |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case #(found_treasure.0, desired_treasure.0, place.0) {
    #("Brass Spyglass", _, _) -> True
    #("Amethyst Octopus", "Crystal Crab", "Stormy Breakwater") -> True
    #("Amethyst Octopus", "Glass Starfish", "Stormy Breakwater") -> True
    #(
      "Vintage Pirate Hat",
      "Model Ship in Large Bottle",
      "Harbor Managers Office",
    ) -> True
    #(
      "Vintage Pirate Hat",
      "Antique Glass Fishnet Float",
      "Harbor Managers Office",
    ) -> True
    _ -> False
  }
}
