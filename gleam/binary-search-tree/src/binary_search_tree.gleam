import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  add(Nil, data)
}

fn add(tree: Tree, data: List(Int)) -> Tree {
  case data {
    [] -> tree
    [x, ..xs] ->
      {
        case tree {
          Nil -> Node(data: x, left: Nil, right: Nil)
          Node(data, left, right) ->
            case x <= data {
              True -> Node(data, add(left, [x]), right)
              False -> Node(data, left, add(right, [x]))
            }
        }
      }
      |> add(xs)
  }
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  to_tree(data) |> traverse([])
}

fn traverse(tree: Tree, acc: List(Int)) -> List(Int) {
  case tree {
    Nil -> acc
    Node(data, left, right) -> {
      traverse(left, [])
      |> list.append([data])
      |> list.append(traverse(right, []))
    }
  }
}
