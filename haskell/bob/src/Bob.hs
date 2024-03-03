module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor xs
  | isQuestion xs && isYelling xs = "Calm down, I know what I'm doing!"
  | isQuestion xs = "Sure."
  | isYelling xs = "Whoa, chill out!"
  | isWhitespace xs = "Fine. Be that way!"
  | otherwise = "Whatever."
  where
    isQuestion :: String -> Bool
    isQuestion ys = not (null nonWhitespace) && last nonWhitespace == '?'
      where
        nonWhitespace = filter (not . isSpace) ys

    isYelling :: String -> Bool
    isYelling ys = not (null letters) && all isUpper letters
      where
        letters = filter isLetter ys

    isWhitespace :: String -> Bool
    isWhitespace = all isSpace
