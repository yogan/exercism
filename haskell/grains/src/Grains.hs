module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n < 1 || n > 64 = Nothing
  | otherwise = Just $ 2 ^ (n - 1)

total :: Integer
total = sum $ unjust $ mapM square [1 .. 64]

unjust :: Maybe a -> a
unjust Nothing = error "no nothing, only just!"
unjust (Just a) = a
