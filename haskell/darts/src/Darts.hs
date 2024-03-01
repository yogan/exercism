module Darts (score) where

score :: Float -> Float -> Int
score x y = points
    where distance = sqrt (x^(2::Int) + y^(2::Int))
          points = case distance of
              _ | distance > 10 -> 0
              _ | distance > 5  -> 1
              _ | distance > 1  -> 5
              _                 -> 10
