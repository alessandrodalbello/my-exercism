import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import CollatzConjecture (collatz)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "collatz" $ do
           it "should return Nothing for non-positive values" $ do
               collatz 0       `shouldBe` Nothing
               collatz (-15)   `shouldBe` Nothing
               collatz (-8000) `shouldBe` Nothing
           it "should return 0 for 1" $
               collatz 1 `shouldBe` Just 0
           it "should return log n for powers of 2" $ do
               collatz 2   `shouldBe` Just 1
               collatz 8   `shouldBe` Just 3
               collatz 16  `shouldBe` Just 4
               collatz 256 `shouldBe` Just 8
           it "should return a finite number for other values" $ do
               collatz 12      `shouldBe` Just 9
               collatz 27      `shouldBe` Just 111
               collatz 6171    `shouldBe` Just 261
               collatz 1000000 `shouldBe` Just 152
               collatz 8400511 `shouldBe` Just 685
