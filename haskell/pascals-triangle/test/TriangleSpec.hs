import Test.Hspec      (Spec, describe, hspec, it, shouldBe)
import Test.QuickCheck (Gen, choose, forAll, property)

import Triangle (rows)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "rows" $ do
           it "should compute the Pascal's Triangle of 0" $
                rows 0 `shouldBe` []
           it "should compute the Pascal's Triangle of 1" $
                rows 1 `shouldBe` [[1]]
           it "should compute the Pascal's Triangle of 2" $
                rows 2 `shouldBe` [[1],
                                   [1, 1]]
           it "should compute the Pascal's Triangle of 3" $
                rows 3 `shouldBe` [[1],
                                   [1, 1],
                                   [1, 2, 1]]
           it "should compute the Pascal's Triangle of 4" $
                rows 4 `shouldBe` [[1],
                                   [1, 1],
                                   [1, 2, 1],
                                   [1, 3, 3, 1]]
           it "should compute the Pascal's Triangle of 5" $
                rows 5 `shouldBe` [[1],
                                   [1, 1],
                                   [1, 2, 1],
                                   [1, 3, 3, 1],
                                   [1, 4, 6, 4, 1]]
           it "should compute the Pascal's Triangle of 6" $
                rows 6 `shouldBe` [[1],
                                   [1, 1],
                                   [1, 2, 1],
                                   [1, 3, 3, 1],
                                   [1, 4, 6, 4, 1],
                                   [1, 5, 10, 10, 5, 1]]
           it "should compute the Pascal's Triangle of 10" $
                rows 10 `shouldBe` [[1],
                                    [1, 1],
                                    [1, 2, 1],
                                    [1, 3, 3, 1],
                                    [1, 4, 6, 4, 1],
                                    [1, 5, 10, 10, 5, 1],
                                    [1, 6, 15, 20, 15, 6, 1],
                                    [1, 7, 21, 35, 35, 21, 7, 1],
                                    [1, 8, 28, 56, 70, 56, 28, 8, 1],
                                    [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]]
           it "each Pascal's Triangle of n is high n" $ property $
               forAll (choose (0, 200)) (\n -> length (rows n) == (n :: Int))
           it "the last row of each Pascal's Triangle of n is long n" $ property $
               forAll (choose (1, 200)) (\n -> length (last (rows n)) == (n :: Int))
