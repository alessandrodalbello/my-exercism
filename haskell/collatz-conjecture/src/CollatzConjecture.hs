module CollatzConjecture (collatz) where

collatz :: Integral a => a -> Maybe a
collatz n = if n <= 0 then Nothing else collatz' n 0

collatz' :: Integral a => a -> a -> Maybe a
collatz' n steps
    | n == 1    = Just steps
    | even n    = collatz' (n `div` 2) (steps + 1)
    | otherwise = collatz' (n * 3 + 1) (steps + 1)