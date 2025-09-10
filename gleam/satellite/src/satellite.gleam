import gleam/list
import gleam/result
import gleam/set

pub type Tree(a) {
  Nil
  Node(value: a, left: Tree(a), right: Tree(a))
}

pub type Error {
  DifferentLengths
  DifferentItems
  NonUniqueItems
}

pub fn tree_from_traversals(
  inorder inorder: List(a),
  preorder preorder: List(a),
) -> Result(Tree(a), Error) {
  validate(inorder, preorder)
  |> result.map(fn(_) { traverse(inorder, preorder) })
}

fn traverse(inorder inorder: List(a), preorder preorder: List(a)) -> Tree(a) {
  case preorder {
    [] -> Nil
    [h, ..rest] -> {
      let #(in_left, in_right) = inorder |> list.split_while(fn(x) { x != h })
      let #(pre_left, pre_right) =
        rest |> list.partition(fn(x) { list.contains(in_left, x) })
      let in_right = list.drop(in_right, 1)
      Node(h, traverse(in_left, pre_left), traverse(in_right, pre_right))
    }
  }
}

fn validate(
  inorder inorder: List(a),
  preorder preorder: List(a),
) -> Result(String, Error) {
  let inorder_set = set.from_list(inorder)
  let preorder_set = set.from_list(preorder)

  let inorder_set_size = set.size(inorder_set)
  let preorder_set_size = set.size(preorder_set)

  case
    inorder_set_size == list.length(inorder)
    && preorder_set_size == list.length(preorder)
  {
    True -> {
      case inorder_set_size == preorder_set_size {
        True ->
          case inorder_set == preorder_set {
            True -> Ok("")
            False -> Error(DifferentItems)
          }
        False -> Error(DifferentLengths)
      }
    }
    False -> Error(NonUniqueItems)
  }
}
