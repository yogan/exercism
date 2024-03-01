module ReverseString (reverseString) where

reverseString :: String -> String
reverseString s = rev s []
    where rev [] acc = acc
          rev (x:xs) acc = rev xs (x:acc)
