module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub values
  where
    multiples n = takeWhile (< limit) [n, n * 2 ..]
    values = concatMap multiples $ filter (/= 0) factors
