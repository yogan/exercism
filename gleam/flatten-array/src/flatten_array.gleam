import gleam/list

pub type NestedList(a) {
  Null
  Value(a)
  List(List(NestedList(a)))
}

pub fn flatten(nested_list: NestedList(a)) -> List(a) {
  case nested_list {
    Null -> []
    Value(a) -> [a]
    List([]) -> []
    List([h, ..tail]) -> list.append(flatten(h), flatten(List(tail)))
  }
}
