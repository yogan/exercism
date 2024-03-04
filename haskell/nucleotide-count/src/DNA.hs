module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.List
import Data.Map (Map)
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts dna = case counts of
  Right xs -> Right $ Map.fromList $ defaults ++ xs
  Left err -> Left err
  where
    defaults = [(A, 0), (C, 0), (G, 0), (T, 0)]
    counts = mapM toNucleatideCount $ group $ sort dna

    toNucleatideCount :: String -> Either String (Nucleotide, Int)
    toNucleatideCount xs = case xs of
      [] -> Left "empty dna strand has no nucleotides"
      x : _ -> case x of
        'A' -> Right (A, length xs)
        'C' -> Right (C, length xs)
        'G' -> Right (G, length xs)
        'T' -> Right (T, length xs)
        _ -> Left $ "invalid nucleotide " ++ [x]
