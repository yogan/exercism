import gleam/list
import gleam/string

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  diagram
  |> string.split("\n")
  |> list.map(extract(_, student))
  |> string.concat
  |> string.to_graphemes
  |> list.map(to_plant)
}

fn extract(line: String, student: Student) -> String {
  line |> string.slice(at_index: student |> offset, length: 2)
}

fn offset(student: Student) -> Int {
  case student {
    Alice -> 0
    Bob -> 2
    Charlie -> 4
    David -> 6
    Eve -> 8
    Fred -> 10
    Ginny -> 12
    Harriet -> 14
    Ileana -> 16
    Joseph -> 18
    Kincaid -> 20
    Larry -> 22
  }
}

fn to_plant(char: String) -> Plant {
  case char {
    "R" -> Radishes
    "C" -> Clover
    "V" -> Violets
    "G" -> Grass
    _ -> panic as "invalid char"
  }
}
