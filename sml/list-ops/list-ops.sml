fun concat       [] = []
  | concat ([]::xs) = concat xs
  | concat  (x::xs) = (hd x) :: concat (tl x :: xs)

fun reverse xs =
  let
    fun rev (lst, acc) =
      case lst of [] => acc
             | x::xs => rev (xs, x::acc)
  in
    rev (xs, [])
  end

fun filter (f, lst) =
  case lst of [] => []
         | x::xs => if f(x)
                    then x :: filter (f, xs)
                    else      filter (f, xs)

fun map (f, lst) =
  case lst of [] => []
         | x::xs => f(x) :: map (f, xs)

fun append (first, second) =
  case first of [] => second
           | x::xs => x :: append (xs, second)

fun length      [] = 0
  | length (x::xs) = 1 + length xs

fun foldl (f, acc, lst) =
  case lst of [] => acc
         | x::xs => foldl (f, f(acc, x), xs)

fun foldr (f, acc, lst) =
  case lst of [] => acc
         | x::xs => f (x, foldr (f, acc, xs))
