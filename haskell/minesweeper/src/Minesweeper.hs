module Minesweeper (annotate) where

type Board = [String]

type Pos = (Int, Int)

annotate :: Board -> Board
annotate [] = []
annotate board = [[countMines (i, j) board m n | j <- [0 .. n]] | i <- [0 .. m]]
  where
    m = length board - 1
    n = length (head board) - 1

countMines :: Pos -> Board -> Int -> Int -> Char
countMines (i, j) board m n
  | isMine (i, j) board = '*'
  | otherwise = case countMines' (i, j) board m n of
      0 -> ' '
      x -> head (show x)

countMines' :: Pos -> Board -> Int -> Int -> Int
countMines' (i, j) board m n = length mines
  where
    indices = [(i + di, j + dj) | di <- [-1, 0, 1], dj <- [-1, 0, 1]]
    validIndices = [(k, l) | (k, l) <- indices, k >= 0 && k <= m && l >= 0 && l <= n]
    mines = filter (`isMine` board) validIndices

isMine :: Pos -> Board -> Bool
isMine (i, j) board = board !! i !! j == '*'
