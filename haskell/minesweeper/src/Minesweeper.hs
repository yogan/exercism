module Minesweeper (annotate) where

type Board = [String]

type Pos = (Int, Int)

type Size = (Int, Int)

annotate :: Board -> Board
annotate [] = []
annotate board = [[countMines board (i, j) | j <- [0 .. n]] | i <- [0 .. m]]
  where
    (m, n) = size board

countMines :: Board -> Pos -> Char
countMines board (i, j)
  | isMine board (i, j) = '*'
  | otherwise = case countMines' board (i, j) of
      0 -> ' '
      x -> head (show x)

countMines' :: Board -> Pos -> Int
countMines' board (i, j) = length $ filter (isMine board) indices
  where
    range = [-1 .. 1]
    indices = [(i + di, j + dj) | di <- range, dj <- range]

isMine :: Board -> Pos -> Bool
isMine board (i, j)
  | i < 0 || i > m || j < 0 || j > n = False
  | otherwise = board !! i !! j == '*'
  where
    (m, n) = size board

size :: Board -> Size
size board = (length board - 1, length (head board) - 1)
