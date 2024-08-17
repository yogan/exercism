module Minesweeper (annotate) where

type Board = [String]

type Pos = (Int, Int)

type Size = (Int, Int)

annotate :: Board -> Board
annotate [] = []
annotate board = [[countMines (i, j) board | j <- [0 .. n]] | i <- [0 .. m]]
  where
    (m, n) = size board

countMines :: Pos -> Board -> Char
countMines (i, j) board
  | isMine (i, j) board = '*'
  | otherwise = case countMines' (i, j) board of
      0 -> ' '
      x -> head (show x)

countMines' :: Pos -> Board -> Int
countMines' (i, j) board = length $ filter (`isMine` board) indices
  where
    range = [-1 .. 1]
    indices = [(i + di, j + dj) | di <- range, dj <- range]

isMine :: Pos -> Board -> Bool
isMine (i, j) board
  | i < 0 || i > m || j < 0 || j > n = False
  | otherwise = board !! i !! j == '*'
  where
    (m, n) = size board

size :: Board -> Size
size board = (length board - 1, length (head board) - 1)
