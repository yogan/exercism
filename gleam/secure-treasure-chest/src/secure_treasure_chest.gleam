import gleam/string

pub opaque type TreasureChest(a) {
  TreasureChest(password: String, contents: a)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case string.length(password) {
    l if l < 8 -> Error("Password must be at least 8 characters long")
    _ -> Ok(TreasureChest(password: password, contents: contents))
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case password == chest.password {
    True -> Ok(chest.contents)
    False -> Error("Incorrect password")
  }
}
