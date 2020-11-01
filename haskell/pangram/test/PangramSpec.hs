import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import Pangram (isPangram)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "isPangram" $ do
          it "empty sentence should not be pangram" $
            isPangram "" `shouldBe` False
          it "only spaces sentences should not be pangrams" $ do
            isPangram "   " `shouldBe` False
            isPangram "            " `shouldBe` False
          it "should identify pangrams of lower case only sentences" $ do
            isPangram "abcdefghijklmnopqrstuvwxyz" `shouldBe` True
            isPangram "the quick brown fox jumps over the lazy dog" `shouldBe` True
          it "should identify pangrams of upper case only sentences" $ do
            isPangram "ABCDEFGHIJKLMNOPQRSTUVWXYZ" `shouldBe` True
            isPangram "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG" `shouldBe` True
          it "should identify pangrams of mixed case sentences" $ do
            isPangram "ABCdefGHIjklMNOpqrSTUvwxYZ" `shouldBe` True
            isPangram "The quick brown Fox jumps over the lazy Dog" `shouldBe` True
          it "should not consider the sentence a pangram if one letter is missing" $ do
            isPangram "a quick movement of the enemy will jeopardize five gunboats" `shouldBe` False
            isPangram "five boxing wizards jump quickly at it" `shouldBe` False
          it "should identify pangrams when symbols and punctuation are included in sentences" $ do
            isPangram "the_quick_brown_fox_jumps_over_the_lazy_dog" `shouldBe` True
            isPangram "when zombies arrive, quickly fax judge Pat." `shouldBe` True
            isPangram "Grumpy wizards make a toxic brew for the jovial queen." `shouldBe` True
            isPangram "\"Five quacking Zephyrs jolt my wax bed.\"" `shouldBe` True
          it "should identify pangrams when numbers are included in sentences" $ do
            isPangram "the 1 quick brown fox jumps over the 2 lazy dogs" `shouldBe` True
            isPangram "Jim quickly realized that the beautiful 3 gowns are expensive" `shouldBe` True
          it "should not consider numbers as letters in sentences" $ do
            isPangram "th3 quick brown fox jumps ov3r th3 lazy dog" `shouldBe` False
            isPangram "the quick br0wn f0x jumps 0ver the lazy d0g" `shouldBe` False
          it "should not consider non-ascii letters as standard letters in sentences" $ do
            isPangram "thè quick brown fox jumps òver the lÃzy dog" `shouldBe` False
            isPangram "when zombies ärrive qũickly fax jüdge pat" `shouldBe` False