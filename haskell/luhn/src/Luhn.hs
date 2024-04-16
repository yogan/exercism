module Luhn (isValid) where

import Data.Char (digitToInt)
import GHC.Unicode (isDigit)

isValid :: String -> Bool
isValid "0" = False
isValid " 0" = False
isValid n =
  let digits = reverse $ map digitToInt $ filter isDigit n
      factors = cycle [1 :: Int, 2]
      products = zipWith (*) digits factors
      checksum = sum $ map (\d -> if d > 9 then d - 9 else d) products
   in mod checksum 10 == 0
