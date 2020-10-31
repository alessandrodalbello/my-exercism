module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Fractional a => Planet -> a -> a
ageOn planet secs = case planet
                        of Mercury -> earthYear 0.2408467 secs
                           Venus   -> earthYear 0.61519726 secs
                           Earth   -> earthYear 1 secs
                           Mars    -> earthYear 1.8808158 secs
                           Jupiter -> earthYear 11.862615 secs
                           Saturn  -> earthYear 29.447498 secs
                           Uranus  -> earthYear 84.016846 secs
                           Neptune -> earthYear 164.79132 secs

earthYear :: Fractional a => a -> a -> a
earthYear period seconds = seconds / period / 31557600