pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  filter(list, predicate)
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  filter(list, fn(x) { !predicate(x) })
}

fn filter(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [] -> []
    [head, ..tail] ->
      case predicate(head) {
        True -> [head, ..filter(tail, predicate)]
        False -> filter(tail, predicate)
      }
  }
}
