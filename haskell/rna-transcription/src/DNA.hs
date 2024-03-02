module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA [] = Right []
toRNA (x:xs) = case x of
    'G' -> toRNA xs >>= \ys -> Right ('C':ys)
    'C' -> toRNA xs >>= \ys -> Right ('G':ys)
    'T' -> toRNA xs >>= \ys -> Right ('A':ys)
    'A' -> toRNA xs >>= \ys -> Right ('U':ys)
    _ -> Left x
