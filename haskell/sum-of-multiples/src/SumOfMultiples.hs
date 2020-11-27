module SumOfMultiples (sumOfMultiples) where

import Data.List (union)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ foldl union [] $ map (`multiples` limit) factors

multiples :: Integer -> Integer -> [Integer]
multiples factor limit
    | factor == 0 = []
    | otherwise   = takeWhile (< limit) [factor, factor * 2..]
