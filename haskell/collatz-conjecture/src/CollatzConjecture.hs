module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n | n <= 0 = Nothing
collatz n = pure $ toInteger $ length $ takeWhile (/= 1) $ chain n

chain :: Integer -> [Integer]
chain n
  | even n = n : chain (n `div` 2)
  | otherwise = n : chain (n * 3 + 1)
