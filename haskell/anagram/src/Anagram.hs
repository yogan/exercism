module Anagram (anagramsFor) where

import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs yss = filter (isAnagram xs) noDupes
  where
    noDupes = filter (not . sameWord) yss
    sameWord ys = map toLower xs == map toLower ys

isAnagram :: String -> String -> Bool
isAnagram [] [] = True
isAnagram (_ : _) [] = False
isAnagram [] (_ : _) = False
isAnagram (x : xs) ys
  | lx `elem` lys = isAnagram xs (dropFirst lx lys)
  | otherwise = False
  where
    lx = toLower x
    lys = map toLower ys

dropFirst :: Char -> String -> String
dropFirst _ [] = []
dropFirst c (x : xs)
  | c == x = xs
  | otherwise = x : dropFirst c xs
