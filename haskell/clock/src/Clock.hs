module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock h' m'
  where
    h' = (h + hoursFromMinutes) `mod` 24
    (hoursFromMinutes, m') = m `divMod` 60

toString :: Clock -> String
toString (Clock h m) = formatHour h ++ ":" ++ zeroPad m
  where
    formatHour n = if n == 24 then "00" else zeroPad n
    zeroPad n = if n < 10 then "0" ++ show n else show n

addDelta :: Int -> Int -> Clock -> Clock
addDelta h1 m1 (Clock h2 m2) = fromHourMin (h1 + h2) (m1 + m2)
