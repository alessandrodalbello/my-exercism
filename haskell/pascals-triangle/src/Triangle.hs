module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n
    | n == 0    = []
    | n == 1    = [[1]]
    | otherwise = let prevTriangle = rows (n - 1)
                      prevRow = last prevTriangle
                   in prevTriangle ++ [zipWith (+) (0 : prevRow) (prevRow ++ [0])]
