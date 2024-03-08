module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor s = filter (isAnagram s)
  where
    isAnagram :: String -> String -> Bool
    isAnagram xs ys = lxs /= lys && sort lxs == sort lys
      where
        lxs = map toLower xs
        lys = map toLower ys
