module DNA (nucleotideCounts, Nucleotide(..)) where

import qualified Data.Map as M
import           Data.Map  (Map)
import           Data.Char (toUpper)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts dna = fmap (M.unionsWith (+)) (traverse mapNucleotide dna)

mapNucleotide :: Char -> Either String (Map Nucleotide Int)
mapNucleotide nucleotide = case dnaNucleotide of
                            'C' -> Right (M.singleton C 1)
                            'G' -> Right (M.singleton G 1)
                            'T' -> Right (M.singleton T 1)
                            'A' -> Right (M.singleton A 1)
                            _   -> Left ("Invalid nucleotide " ++ [nucleotide])
                            where dnaNucleotide = toUpper nucleotide