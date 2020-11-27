import Test.Hspec     (Spec, describe, hspec, it, shouldBe)

import SumOfMultiples (sumOfMultiples)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "sumOfMultiples" $ do
            it "should handle the case of multiples bigger then limit" $ do
              sumOfMultiples [3, 5] 1 `shouldBe` 0
              sumOfMultiples [3, 5] 2 `shouldBe` 0
              sumOfMultiples [7] 6 `shouldBe` 0
            it "should handle the case of one multiple within the limit" $ do
              sumOfMultiples [3, 5] 4 `shouldBe` 3
              sumOfMultiples [5, 11] 10 `shouldBe` 5
              sumOfMultiples [3] 7 `shouldBe` 9
            it "should handle the general case of multiples within the limit" $ do
              sumOfMultiples [3, 5] 10 `shouldBe` 23
              sumOfMultiples [3, 5] 100 `shouldBe` 2318
              sumOfMultiples [3, 5] 1000 `shouldBe` 233168
              sumOfMultiples [7, 13, 17] 20 `shouldBe` 51
              sumOfMultiples [43, 47] 10000 `shouldBe` 2203160
              sumOfMultiples [2, 3, 5, 7, 11] 10000 `shouldBe` 39614537
            it "should handle factors not relatively prime between each other" $ do
              sumOfMultiples [4, 6] 15 `shouldBe` 30
              sumOfMultiples [5, 6, 8] 150 `shouldBe` 4419
              sumOfMultiples [5, 25] 51 `shouldBe` 275
            it "should handle edge cases" $ do
              sumOfMultiples [1] 100 `shouldBe` 4950
              sumOfMultiples [] 10000 `shouldBe` 0
              sumOfMultiples [0] 42 `shouldBe` 0
              sumOfMultiples [3, 0] 4 `shouldBe` 3