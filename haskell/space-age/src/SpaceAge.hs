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
ageOn planet seconds = seconds / yearPeriod planet / 31557600

yearPeriod :: Fractional a => Planet -> a
yearPeriod planet = case planet 
                      of Mercury -> 0.2408467
                         Venus   -> 0.61519726
                         Earth   -> 1.0
                         Mars    -> 1.8808158
                         Jupiter -> 11.862615
                         Saturn  -> 29.447498
                         Uranus  -> 84.016846
                         Neptune -> 164.79132