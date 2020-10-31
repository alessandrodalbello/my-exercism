import Test.Hspec      (Spec, context, describe, hspec, it)
import Test.QuickCheck (property)

import SpaceAge (Planet(..), ageOn)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "ageOn" $ do
       context "when we are on Mercury" $
           it "one year should last 7600543.81992 seconds" $ property $
             \age -> abs (ageOn Mercury (age * 7600543.81992) - age) <= (0.00001 :: Double)
       context "when we are on Venus" $
           it "one year should last 19414149.052176 seconds" $ property $
             \age -> abs (ageOn Venus (age * 19414149.052176) - age) <= (0.00001 :: Double)
       context "when we are on Earth" $
           it "one year should last 31557600 seconds" $ property $
             \age -> abs (ageOn Earth (age * 31557600) - age) <= (0.00001 :: Double)
       context "when we are on Mars" $
           it "one year should last 59354032.69008 seconds" $ property $
             \age -> abs (ageOn Mars (age * 59354032.69008) - age) <= (0.00001 :: Double)
       context "when we are on Jupiter" $
           it "one year should last 374355659.124 seconds" $ property $
             \age -> abs (ageOn Jupiter (age * 374355659.124) - age) <= (0.00001 :: Double)
       context "when we are on Saturn" $
           it "one year should last 929292362.8848 seconds" $ property $
             \age -> abs (ageOn Saturn (age * 929292362.8848) - age) <= (0.00001 :: Double)
       context "when we are on Uranus" $
           it "one year should last 2651370019.3296 seconds" $ property $
             \age -> abs (ageOn Uranus (age * 2651370019.3296) - age) <= (0.00001 :: Double)
       context "when we are on Neptune" $
           it "one year should last 5200418560.032 seconds" $ property $
             \age -> abs (ageOn Neptune (age * 5200418560.032) - age) <= (0.00001 :: Double)