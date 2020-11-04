module Bob (responseFor) where

import qualified Data.Text as T
import           Data.Text (Text)
import           Data.Char (isAlpha, isUpper)

responseFor :: Text -> Text
responseFor text
    | T.null cleanText         = T.pack "Fine. Be that way!"
    | isQuestion && not isYell = T.pack "Sure."
    | isQuestion && isYell     = T.pack "Calm down, I know what I'm doing!"
    | isYell                   = T.pack "Whoa, chill out!"
    | otherwise                = T.pack "Whatever."
        where cleanText  = T.strip text
              isQuestion = T.last cleanText == '?'
              alphaText  = T.filter isAlpha cleanText
              isYell     = not (T.null alphaText) && T.all isUpper alphaText
