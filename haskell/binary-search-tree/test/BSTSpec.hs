import Data.List       (sort)
import Test.Hspec      (Spec, hspec, it, shouldBe)
import Test.QuickCheck (property)

import BST
    ( bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    )

main :: IO ()
main = hspec specs

specs :: Spec
specs = do
    it "should retain one value" $
        bstValue (singleton 42) `shouldBe` Just 42
    it "should insert smaller values into the left sub-tree" $ do
        let tree = insert 23 (singleton 42) 
        bstValue tree `shouldBe` Just 42
        (bstLeft tree >>= bstValue) `shouldBe` Just 23
    it "should insert equal values into the left sub-tree" $ do
        let tree = insert 42 (singleton 42)
        bstValue tree `shouldBe` Just 42
        (bstLeft tree >>= bstValue) `shouldBe` Just 42
    it "should insert greater values into the right sub-tree" $ do
        let tree = insert 73 (singleton 42)
        bstValue tree `shouldBe` Just 42
        (bstRight tree >>= bstValue) `shouldBe` Just 73
    it "should generate an empty tree from an empty list" $
        fromList ([] :: [Int]) `shouldBe` empty
    it "should not contain any value if empty" $
        bstValue (fromList ([] :: [Int])) `shouldBe` Nothing
    it "should insert values into an empty tree" $ do
        let tree = insert 42 empty
        bstValue tree `shouldBe` Just 42
    it "should store all values in order of insertion" $ do
        let tree = fromList [4, 2, 6, 1, 3, 7, 5]
        bstValue  tree                            `shouldBe` Just 4
        (bstLeft  tree >>= bstValue             ) `shouldBe` Just 2
        (bstLeft  tree >>= bstLeft  >>= bstValue) `shouldBe` Just 1
        (bstLeft  tree >>= bstRight >>= bstValue) `shouldBe` Just 3
        (bstRight tree >>= bstValue             ) `shouldBe` Just 6
        (bstRight tree >>= bstLeft  >>= bstValue) `shouldBe` Just 5
        (bstRight tree >>= bstRight >>= bstValue) `shouldBe` Just 7
    it "should return an empty list when an empty tree is converted into a list" $
        null (toList empty) `shouldBe` True
    it "should return a list of one element when a singleton tree is converted into a list" $
        toList (singleton 42) `shouldBe` [42]
    it "should return a sorted list when a tree is converted into a list" $ do
        toList (fromList [42, 23])                   `shouldBe` [23, 42]
        toList (fromList [42, 99])                   `shouldBe` [42, 99]
        toList (fromList [42, 44, 42])               `shouldBe` [42, 42, 44]
        toList (fromList [62, 23, 1, 31, 60, 79, 5]) `shouldBe` [1, 5, 23, 31, 60, 62, 79]
    it "should work on integer numbers" $ property $
        \xs -> toList (fromList xs) == sort (xs :: [Int])
    it "should work on decimal numbers" $ property $
        \xs -> toList (fromList xs) == sort (xs :: [Double])
    it "should work on strings" $ property $
        \xs -> toList (fromList xs) == sort (xs :: [String])
    it "should work on lists" $ property $
        \xs -> toList (fromList xs) == sort (xs :: [[Int]])
