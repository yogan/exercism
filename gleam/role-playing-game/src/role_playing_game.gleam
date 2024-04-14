import gleam/option.{type Option, None, Some}
import gleam/int.{max}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    None -> "Mighty Magician"
    Some(name) -> name
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    health if health == 0 ->
      Some(Player(
        name: player.name,
        level: player.level,
        // full health
        health: 100,
        mana: case player.level {
          level if level >= 10 -> Some(100)
          _ -> player.mana
        },
      ))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) ->
      case cost <= mana {
        True -> #(
          Player(
            name: player.name,
            level: player.level,
            health: player.health,
            mana: Some(mana - cost),
          ),
          cost * 2,
        )
        False -> #(player, 0)
      }
    None -> #(
      Player(
        name: player.name,
        level: player.level,
        health: max(0, player.health - cost),
        mana: None,
      ),
      0,
    )
  }
}
