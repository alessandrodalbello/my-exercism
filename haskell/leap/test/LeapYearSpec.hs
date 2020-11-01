import Test.Hspec      (Spec, describe, hspec, it)
import Test.QuickCheck (Gen, choose, forAll, property, suchThat)

import LeapYear (isLeapYear)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "isLeapYear" $ do
          it "years not divisible by 4 should not be leap" $ property $
            forAll (genYear (\year -> year `rem` 4 /= 0))
              (\year -> isLeapYear year == False)
          it "years divisible by 4 and by 100, but not by 400, should not be leap" $ property $
            forAll (genYear (\year -> year `rem` 4 == 0 && year `rem` 100 == 0 && year `rem` 400 /= 0))
              (\year -> isLeapYear year == False)
          it "years divisible by 4 and not by 100 should be leap" $ property $
            forAll (genYear (\year -> year `rem` 4 == 0 && year `rem` 100 /= 0))
              (\year -> isLeapYear year == True)
          it "years divisible by 4 and by 400 should be leap" $ property $
            forAll (genYear (\year -> year `rem` 4 == 0 && year `rem` 400 == 0))
              (\year -> isLeapYear year == True)

genYear :: (Integer -> Bool) -> Gen Integer
genYear = suchThat $ choose (-5000, 10000)