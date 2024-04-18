module Prime (nth) where

nth :: Int -> Maybe Integer
nth n = if n < 1 then Nothing else Just $ primes !! (n - 1)

primes :: [Integer]
primes = 2 : filter isPrime [3, 5 ..]

isPrime :: Integer -> Bool
isPrime n = all (\x -> n `mod` x /= 0) [2 .. limit]
  where
    limit = (floor . (sqrt :: Double -> Double) . fromIntegral) n
