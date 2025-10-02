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
  |> list.fold(#(direction, position), fn(state, instruction) {
    let #(dir, pos) = state
    case instruction {
      "R" -> #(turn_right(dir), pos)
      "L" -> #(turn_left(dir), pos)
      "A" -> #(dir, advance(dir, pos))
      _ -> panic as "illegal move"
    }
  })
  |> fn(result) { create(result.0, result.1) }
}

fn turn_right(direction: Direction) -> Direction {
  case direction {
    North -> East
    East -> South
    South -> West
    West -> North
  }
}

fn turn_left(direction: Direction) -> Direction {
  case direction {
    North -> West
    West -> South
    South -> East
    East -> North
  }
}

fn advance(direction: Direction, position: Position) -> Position {
  let Position(x, y) = position
  case direction {
    North -> Position(x, y + 1)
    South -> Position(x, y - 1)
    East -> Position(x + 1, y)
    West -> Position(x - 1, y)
  }
}
