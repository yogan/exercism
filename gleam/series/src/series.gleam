import gleam/bool
import gleam/list
import gleam/string

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  use <- bool.guard(when: size == 0, return: Error(SliceLengthZero))
  use <- bool.guard(when: size < 0, return: Error(SliceLengthNegative))
  use <- bool.guard(when: string.is_empty(input), return: Error(EmptySeries))
  use <- bool.guard(
    when: string.length(input) < size,
    return: Error(SliceLengthTooLarge),
  )

  input
  |> string.to_graphemes
  |> list.window(size)
  |> list.map(string.join(_, with: ""))
  |> Ok
}

pub type Error {
  EmptySeries
  SliceLengthTooLarge
  SliceLengthNegative
  SliceLengthZero
}
