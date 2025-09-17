import gleam/float

pub fn score(x: Float, y: Float) -> Int {
  let assert Ok(dist) = float.square_root(x *. x +. y *. y)
  case dist {
    d if d <=. 1.0 -> 10
    d if d <=. 5.0 -> 5
    d if d <=. 10.0 -> 1
    _ -> 0
  }
}
