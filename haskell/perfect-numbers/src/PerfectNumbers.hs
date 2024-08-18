module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0 = Nothing
  | otherwise = case compare n (sum $ factors n) of
      EQ -> Just Perfect
      LT -> Just Abundant
      GT -> Just Deficient
  where
    factors :: Int -> [Int]
    factors n = [k | k <- [1 .. n `div` 2], n `mod` k == 0]
