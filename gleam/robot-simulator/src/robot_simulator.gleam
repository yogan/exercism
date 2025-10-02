import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  instructions
  |> string.to_graphemes
  |> list.fold(#(direction, position), fn(dir_pos, move) {
    let #(dir, pos) = dir_pos
    case move {
      "R" ->
        case dir {
          North -> #(East, pos)
          East -> #(South, pos)
          South -> #(West, pos)
          West -> #(North, pos)
        }
      "L" ->
        case dir {
          North -> #(West, pos)
          West -> #(South, pos)
          South -> #(East, pos)
          East -> #(North, pos)
        }
      "A" -> {
        let Position(x, y) = pos
        case dir {
          North -> #(North, Position(x, y + 1))
          South -> #(South, Position(x, y - 1))
          East -> #(East, Position(x + 1, y))
          West -> #(West, Position(x - 1, y))
        }
      }
      _ -> panic as "illegal move"
    }
  })
  |> fn(dir_pos) { create(dir_pos.0, dir_pos.1) }
}
