module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n = iterate reverse actions !! last nBinary
                where binary  = toBinary n
                      nBinary = binary ++ replicate (5 - length binary) 0
                      actions = concat $ zipWith replicate nBinary baseActions

baseActions :: [String]
baseActions = ["wink", "double blink", "close your eyes", "jump"]

toBinary :: Int -> [Int]
toBinary 0 = []
toBinary n = (n `rem` 2) : toBinary (n `div` 2)
