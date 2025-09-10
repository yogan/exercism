import gleam/bool
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

fn validate(inorder: List(a), preorder: List(a)) -> Result(Tree(b), Error) {
  use <- bool.guard(
    when: list.length(inorder) != list.length(preorder),
    return: Error(DifferentLengths),
  )

  let #(in_set, pre_set) = #(set.from_list(preorder), set.from_list(inorder))

  use <- bool.guard(
    when: set.size(in_set) != list.length(inorder)
      || set.size(pre_set) != list.length(preorder),
    return: Error(NonUniqueItems),
  )

  use <- bool.guard(when: in_set != pre_set, return: Error(DifferentItems))

  Ok(Nil)
}
