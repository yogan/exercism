import gleam/list

pub type Triplet {
  Triplet(Int, Int, Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  list.range(3, sum - 3)
  |> list.flat_map(fn(c) {
    list.range(2, sum - c - 1)
    |> list.map(fn(b) { #(sum - c - b, b) })
    |> list.filter(fn(ab) { ab.0 < ab.1 && ab.0 * ab.0 + ab.1 * ab.1 == c * c })
    |> list.map(fn(ab) { Triplet(ab.0, ab.1, c) })
  })
}
