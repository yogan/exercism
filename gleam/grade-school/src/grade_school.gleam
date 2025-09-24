import gleam/bool
import gleam/dict.{type Dict}
import gleam/list
import gleam/option.{None, Some}
import gleam/result
import gleam/set.{type Set}

pub type School {
  School(roster: Dict(Int, Set(String)))
}

pub fn create() -> School {
  School(dict.new())
}

pub fn roster(school: School) -> List(String) {
  school.roster |> dict.values |> list.flat_map(set.to_list)
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  use <- bool.guard(
    when: roster(school) |> list.contains(student),
    return: Error(Nil),
  )

  school.roster
  |> dict.upsert(grade, fn(x) {
    case x {
      Some(s) -> s
      None -> set.new()
    }
    |> set.insert(student)
  })
  |> School
  |> Ok
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  school.roster
  |> dict.get(desired_grade)
  |> result.map(set.to_list)
  |> result.unwrap([])
}
