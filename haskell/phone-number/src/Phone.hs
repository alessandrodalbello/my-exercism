module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number phone = if length phoneNumb == 10 && head phoneNumb >= '2' && phoneNumb !! 3 >= '2'
                 then Just phoneNumb
                 else Nothing
               where phoneNumb = dropWhile (== '1') $ filter isDigit phone
