module CryptoSquare (encode) where

import Data.Char (isAlpha, isDigit, toLower)
import Data.List (transpose)

encode :: String -> String
encode [] = []
encode xs = unwords $ transpose $ toRows xs

toRows :: String -> [String]
toRows xs = map (pad c) $ chunksOf c n
  where
    n = normalize xs
    (c, _) = dimensions n

normalize :: String -> String
normalize [] = []
normalize (x : xs)
  | isAlpha x || isDigit x = toLower x : normalize xs
  | otherwise = normalize xs

dimensions :: String -> (Int, Int)
dimensions xs = (ceiling s, floor s)
  where
    s = sqrt $ fromIntegral $ length xs

pad :: Int -> String -> String
pad c s = s ++ replicate n ' '
  where
    n = c - length s

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)
