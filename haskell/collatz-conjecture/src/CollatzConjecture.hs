module CollatzConjecture (collatz) where

collatz :: Integral a => a -> Maybe a
collatz n = if n <= 0 then Nothing else Just (collatz' n 0)

collatz' :: Integral a => a -> a -> a
collatz' n steps
    | n == 1    = steps
    | even n    = collatz' (n `div` 2) (steps + 1)
    | otherwise = collatz' (n * 3 + 1) (steps + 1)