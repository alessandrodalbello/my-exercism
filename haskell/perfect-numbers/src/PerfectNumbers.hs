module PerfectNumbers (Classification(..), classify) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Integral a => a -> Maybe Classification
classify n
    | n <= 0          = Nothing
    | aliquotSum == n = Just Perfect
    | aliquotSum > n  = Just Abundant
    | otherwise       = Just Deficient
        where aliquotSum = sum (divisors n)

divisors :: Integral a => a -> [a]
divisors n = [ d | d <- [1..n `div` 2], n `rem` d == 0 ]