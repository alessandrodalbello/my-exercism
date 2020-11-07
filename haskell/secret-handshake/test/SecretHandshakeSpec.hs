import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import SecretHandshake (handshake)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "handshake" $ do
           it "should generate no actions if 0" $
               handshake 0 `shouldBe` []
           it "should generate no actions if 16" $
               handshake 16 `shouldBe` []
           it "should generate one action for basic cases" $ do
               handshake 1 `shouldBe` ["wink"]
               handshake 2 `shouldBe` ["double blink"]
               handshake 4 `shouldBe` ["close your eyes"]
               handshake 8 `shouldBe` ["jump"]
           it "should generate one action for reverted basic cases" $ do
               handshake 17 `shouldBe` ["wink"]
               handshake 18 `shouldBe` ["double blink"]
               handshake 20 `shouldBe` ["close your eyes"]
               handshake 24 `shouldBe` ["jump"]
           it "should able to combine two actions" $ do
               handshake 3  `shouldBe` ["wink", "double blink"]
               handshake 5  `shouldBe` ["wink", "close your eyes"]
               handshake 12 `shouldBe` ["close your eyes", "jump"]
               handshake 19 `shouldBe` ["double blink", "wink"]
               handshake 21 `shouldBe` ["close your eyes", "wink"]
               handshake 28 `shouldBe` ["jump", "close your eyes"]
           it "should able to combine three actions" $ do
               handshake 7  `shouldBe` ["wink", "double blink", "close your eyes"]
               handshake 14 `shouldBe` ["double blink", "close your eyes", "jump"]
               handshake 23 `shouldBe` ["close your eyes", "double blink", "wink"]
               handshake 30 `shouldBe` ["jump", "close your eyes", "double blink"]
           it "should able to combine all four actions" $ do
               handshake 15 `shouldBe` ["wink", "double blink", "close your eyes", "jump"]
               handshake 31 `shouldBe` ["jump", "close your eyes", "double blink", "wink"]
