import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  data |> list.fold(Nil, add)
}

fn add(tree: Tree, value: Int) -> Tree {
  case tree {
    Nil -> Node(value, Nil, Nil)
    Node(data, left, right) ->
      case value <= data {
        True -> Node(data, add(left, value), right)
        False -> Node(data, left, add(right, value))
      }
  }
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  data |> to_tree |> traverse([])
}

fn traverse(tree: Tree, acc: List(Int)) -> List(Int) {
  case tree {
    Nil -> acc
    Node(data, left, right) -> traverse(left, [data, ..traverse(right, acc)])
  }
}
