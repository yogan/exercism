module GameOfLife (tick) where

dead, alive :: Int
dead = 0
alive = 1

type Pos = (Int, Int)

tick :: [[Int]] -> [[Int]]
tick [] = []
tick xss = toMatrix aliveCells n m
  where
    n = length xss - 1
    m = length (head xss) - 1
    aliveCells = livingCells xss n m

toMatrix :: [Pos] -> Int -> Int -> [[Int]]
toMatrix living n m = [[next (i, j) living | j <- [0 .. n]] | i <- [0 .. m]]

next :: Pos -> [Pos] -> Int
next p living
  | p `elem` living = if n == 2 || n == 3 then alive else dead
  | otherwise = if n == 3 then alive else dead
  where
    n = length $ livingNeighbors p living

livingCells :: [[Int]] -> Int -> Int -> [Pos]
livingCells xss n m =
  [(i, j) | i <- [0 .. n], j <- [0 .. m], (/= dead) $ xss !! i !! j]

livingNeighbors :: Pos -> [Pos] -> [Pos]
livingNeighbors (i, j) living = [c | c <- neighbors, c `elem` living]
  where
    ds = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    neighbors = [(i + di, j + dj) | (di, dj) <- ds]
