module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.List (group, sort)
import Data.Map (Map)
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts dna = case counts of
  Just xs -> Right $ Map.fromList xs
  Nothing -> Left $ "invalid DNA strand" ++ dna
  where
    counts = mapM count $ group $ sort dna

    count :: String -> Maybe (Nucleotide, Int)
    count xs = case xs of
      [] -> Nothing
      x : _ -> case x of
        'A' -> Just (A, length xs)
        'C' -> Just (C, length xs)
        'G' -> Just (G, length xs)
        'T' -> Just (T, length xs)
        _ -> Nothing
