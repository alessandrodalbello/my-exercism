module DNA (toRNA) where

import Data.Char (toUpper)

toRNA :: String -> Either Char String
toRNA = traverse mapNucleotide

mapNucleotide :: Char -> Either Char Char
mapNucleotide nucleotide = case dnaNucleotide of
                            'C' -> Right 'G'
                            'G' -> Right 'C'
                            'T' -> Right 'A'
                            'A' -> Right 'U'
                            _   -> Left nucleotide
                            where dnaNucleotide = toUpper nucleotide
