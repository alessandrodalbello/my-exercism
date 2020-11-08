import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import DNA (toRNA)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "toRNA" $ do
           it "should transcript empty the DNA sequence" $
               toRNA "" `shouldBe` Right ""
           it "should transcript base DNA nucleotides" $ do
               toRNA "C" `shouldBe` Right "G"
               toRNA "G" `shouldBe` Right "C"
               toRNA "T" `shouldBe` Right "A"
               toRNA "A" `shouldBe` Right "U"
           it "should transcript valid DNA strands" $ do
               toRNA "ACGTGGTCTTAA"    `shouldBe` Right "UGCACCAGAAUU"
               toRNA "TCGGCTAATACTGTA" `shouldBe` Right "AGCCGAUUAUGACAU"
           it "should be case insensitive on valid DNA strands" $ do
               toRNA "acgtggtcttaa"    `shouldBe` Right "UGCACCAGAAUU"
               toRNA "tcggctaatactgta" `shouldBe` Right "AGCCGAUUAUGACAU"
           it "should handle invalid DNA strands" $ do
               toRNA "U"            `shouldBe` Left 'U'
               toRNA "XXX"          `shouldBe` Left 'X'
               toRNA "ACGTXXZCTTAA" `shouldBe` Left 'X'
               toRNA "ACGTkCTTAA"   `shouldBe` Left 'k'
