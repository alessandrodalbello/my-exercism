import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import PerfectNumbers (Classification(..), classify)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "classify" $ do
          it "should classify perfect numbers" $ do
            classify 6        `shouldBe` Just Perfect
            classify 28       `shouldBe` Just Perfect
            classify 496      `shouldBe` Just Perfect
            classify 8128     `shouldBe` Just Perfect
            classify 33550336 `shouldBe` Just Perfect
          it "should classify abundant numbers" $ do
            classify 12       `shouldBe` Just Abundant
            classify 30       `shouldBe` Just Abundant
            classify 42       `shouldBe` Just Abundant
            classify 120      `shouldBe` Just Abundant
            classify 33550335 `shouldBe` Just Abundant
          it "should classify deficient numbers" $ do
            classify 2        `shouldBe` Just Deficient
            classify 4        `shouldBe` Just Deficient
            classify 34       `shouldBe` Just Deficient
            classify 50       `shouldBe` Just Deficient
            classify 33550337 `shouldBe` Just Deficient
          it "should classify 1 as a deficient number (edge case)" $
            classify 1        `shouldBe` Just Deficient
          it "should reject non-positive natural numbers" $ do
            classify 0           `shouldBe` Nothing
            classify (-2)        `shouldBe` Nothing
            classify (-28)       `shouldBe` Nothing
            classify (-42)       `shouldBe` Nothing
            classify (-33550336) `shouldBe` Nothing
