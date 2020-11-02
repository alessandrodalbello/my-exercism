import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import Phone (number)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "number" $ do
          it "should keep the phone number as it is if already cleaned" $
            number "2234567890"         `shouldBe` Just "2234567890"
          it "should clean phone numbers in different formats" $ do
            number "(223) 456-7890"     `shouldBe` Just "2234567890"
            number "223.456.7890"       `shouldBe` Just "2234567890"
            number "223 456 7890"       `shouldBe` Just "2234567890"
            number "223-456-7890"       `shouldBe` Just "2234567890"
          it "should clean phone numbers with prefix" $ do
            number "+1 (223) 456-7890"  `shouldBe` Just "2234567890"
            number "1 (223) 456-7890"   `shouldBe` Just "2234567890"
            number "+1 223.456.7890"    `shouldBe` Just "2234567890"
            number "1 223.456.7890"     `shouldBe` Just "2234567890"
            number "+1 223 456 7890"    `shouldBe` Just "2234567890"
            number "+1 223-456-7890"    `shouldBe` Just "2234567890"
            number "12234567890"        `shouldBe` Just "2234567890"
          it "should be invalid when the number of digits is not correct (10 excluding the prefix)" $ do
            number "223456789"          `shouldBe` Nothing
            number "22345678901"        `shouldBe` Nothing
            number "223.456.789"        `shouldBe` Nothing
            number "223.456.78901"      `shouldBe` Nothing
            number "+1 (223) 456-789"   `shouldBe` Nothing
            number "1 223 456-789"      `shouldBe` Nothing
            number "+1 (223) 456-78903" `shouldBe` Nothing
            number "1 223 456-78903"    `shouldBe` Nothing
          it "should be invalid when the area code starts with 0 or 1" $ do
            number "0234567890"         `shouldBe` Nothing
            number "1234567890"         `shouldBe` Nothing
            number "023.456.7890"       `shouldBe` Nothing
            number "123.456.7890"       `shouldBe` Nothing
            number "(123) 456-7890"     `shouldBe` Nothing
            number "(023) 456-7890"     `shouldBe` Nothing
            number "+1 (023) 456-7890"  `shouldBe` Nothing
            number "+1 (123) 456-7890"  `shouldBe` Nothing
            number "1 023 456-7890"     `shouldBe` Nothing
            number "1 123 456-7890"     `shouldBe` Nothing
          it "should be invalid when the exchange code starts with 0 or 1" $ do
            number "2230567890"         `shouldBe` Nothing
            number "2231567890"         `shouldBe` Nothing
            number "223.056.7890"       `shouldBe` Nothing
            number "223.156.7890"       `shouldBe` Nothing
            number "(223) 056-7890"     `shouldBe` Nothing
            number "(223) 156-7890"     `shouldBe` Nothing
            number "+1 (223) 056-7890"  `shouldBe` Nothing
            number "+1 (223) 156-7890"  `shouldBe` Nothing
            number "1 223 056-7890"     `shouldBe` Nothing
            number "1 223 156-7890"     `shouldBe` Nothing
          it "should be invalid when contains letters or punctuations" $ do
            number "2234abc890"         `shouldBe` Nothing
            number "(223) !456-#890"    `shouldBe` Nothing
            number "22$.056.7€90"       `shouldBe` Nothing
            number "+1 22%.156.7kyz"    `shouldBe` Nothing
            number "1 223 056-7?90"     `shouldBe` Nothing
