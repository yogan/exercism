module Acronym (abbreviate) where

import Data.Char

abbreviate :: String -> String
abbreviate = map (toUpper . firstLetter) . words . unCamel . dashesToSpaces

firstLetter :: String -> Char
firstLetter [] = error "no empty string pls"
firstLetter (x:xs) =
    if isAlpha x
        then x
        else firstLetter xs

unCamel :: String -> String
unCamel [] = []
unCamel [x] = [x]
unCamel (x:y:rest) =
    if isLower x && isUpper y
        then [x, ' ', y] ++ unCamel rest
        else [x,      y] ++ unCamel rest

dashesToSpaces :: String -> String
dashesToSpaces = map $ \c -> if c == '-' then ' ' else c
