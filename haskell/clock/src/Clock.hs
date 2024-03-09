module Clock (addDelta, fromHourMin, toString) where

import Text.Printf

data Clock = Clock Int Int
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock h' m'
  where
    h' = (h + hoursFromMinutes) `mod` 24
    (hoursFromMinutes, m') = m `divMod` 60

toString :: Clock -> String
toString (Clock h m) = printf "%02d:%02d" h m

addDelta :: Int -> Int -> Clock -> Clock
addDelta h1 m1 (Clock h2 m2) = fromHourMin (h1 + h2) (m1 + m2)
