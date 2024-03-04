module SumOfMultiples (sumOfMultiples) where

import Data.Containers.ListUtils (nubOrd)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum $ nubOrd $ concatMap multiples $ filter (/= 0) factors
  where
    multiples n = takeWhile (< limit) [n, n * 2 ..]
