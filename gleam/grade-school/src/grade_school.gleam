import gleam/dict.{type Dict}
import gleam/int
import gleam/list
import gleam/order.{type Order, Eq}
import gleam/string

pub type School {
  School(grades: Dict(String, Int))
}

pub fn create() -> School {
  School(dict.new())
}

fn compare_pair(first: #(String, Int), second: #(String, Int)) -> Order {
  case int.compare(first.1, second.1) {
    Eq -> string.compare(first.0, second.0)
    neq -> neq
  }
}

pub fn roster(school: School) -> List(String) {
  school.grades
  |> dict.to_list
  |> list.sort(compare_pair)
  |> list.map(fn(pair) { pair.0 })
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  case school.grades |> dict.has_key(student) {
    True -> Error(Nil)
    False -> school.grades |> dict.insert(student, grade) |> School |> Ok
  }
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  school.grades
  |> dict.to_list
  |> list.filter(fn(pair) { pair.1 == desired_grade })
  |> list.map(fn(pair) { pair.0 })
}
