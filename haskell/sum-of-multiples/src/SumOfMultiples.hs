module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum $ nub $ concatMap multiples $ filter (/= 0) factors
  where
    multiples n = takeWhile (< limit) [n, n * 2 ..]
