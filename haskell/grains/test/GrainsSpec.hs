import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import Grains (square, total)

main :: IO ()
main = hspec specs

specs :: Spec
specs = do
          describe "square" $ do
            it "should return the correct number of wheat grains if the square is on the chessboard" $ do
              square 1  `shouldBe` Just 1
              square 2  `shouldBe` Just 2
              square 3  `shouldBe` Just 4
              square 4  `shouldBe` Just 8
              square 16 `shouldBe` Just 32768
              square 32 `shouldBe` Just 2147483648
              square 64 `shouldBe` Just 9223372036854775808
            it "should return nothing if the square is not on the chessboard" $ do
              square 0      `shouldBe` Nothing
              square 65     `shouldBe` Nothing
              square 1000   `shouldBe` Nothing
              square (-1)   `shouldBe` Nothing
              square (-100) `shouldBe` Nothing
          describe "total" $
              it "should return the total number of wheat grains on the chessboard" $
                total `shouldBe` 18446744073709551615
