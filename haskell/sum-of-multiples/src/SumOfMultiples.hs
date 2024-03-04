module SumOfMultiples (sumOfMultiples) where

import Data.Set (fromList)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ fromList values
  where
    multiples n = takeWhile (< limit) [n, n * 2 ..]
    values = concatMap multiples $ filter (/= 0) factors
