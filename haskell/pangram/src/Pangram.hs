module Pangram (isPangram) where

import Data.Char (toLower)
import Data.Set (fromList)

isPangram :: String -> Bool
isPangram text = length charSet == length ['a'..'z']
    where charSet = fromList (charsOnly text)

charsOnly :: [Char] -> [Char]
charsOnly [] = []
charsOnly (c:cs)
    | l `elem` ['a'..'z'] = l : charsOnly cs
    | otherwise           =     charsOnly cs
    where l = toLower c
