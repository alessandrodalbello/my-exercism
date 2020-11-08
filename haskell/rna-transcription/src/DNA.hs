module DNA (toRNA) where

import Data.Char (toUpper)

toRNA :: String -> Either Char String
toRNA = foldr (\c acc -> (:) <$> mapNucleotide c <*> acc) (Right "")

mapNucleotide :: Char -> Either Char Char
mapNucleotide nucleotide
    | dnaNucleotide == 'C' = Right 'G'
    | dnaNucleotide == 'G' = Right 'C'
    | dnaNucleotide == 'T' = Right 'A'
    | dnaNucleotide == 'A' = Right 'U'
    | otherwise            = Left nucleotide
        where dnaNucleotide = toUpper nucleotide
