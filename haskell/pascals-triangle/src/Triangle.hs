module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n
    | n == 0    = []
    | n == 1    = [[1]]
    | otherwise = let prevTriangle = rows (n - 1)
                      prevRow = (0 : last prevTriangle) ++ [0]
                   in prevTriangle ++ [zipWith (+) prevRow (tail prevRow)]
