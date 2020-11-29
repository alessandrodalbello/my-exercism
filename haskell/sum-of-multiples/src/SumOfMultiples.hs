module SumOfMultiples (sumOfMultiples) where

import qualified Data.Set as Set
import           Data.Set (Set)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ Set.unions $ map (`multiples` limit) factors

multiples :: Integer -> Integer -> Set Integer
multiples factor limit
    | factor == 0 = Set.empty
    | otherwise   = Set.fromDistinctAscList [factor, factor * 2..limit - 1]
