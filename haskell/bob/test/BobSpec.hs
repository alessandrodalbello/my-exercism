import Test.Hspec (Spec, describe, hspec, it, shouldBe)

import qualified Data.Text as T
import           Data.Text (Text)

import Bob (responseFor)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "responseFor" $ do
           it "should respond 'Fine. Be that way!' when input contains only whitespaces" $ do
               responseForAdapter ""               `shouldBe` "Fine. Be that way!"
               responseForAdapter "      "         `shouldBe` "Fine. Be that way!"
               responseForAdapter "\n\r \t"        `shouldBe` "Fine. Be that way!"
               responseForAdapter "\t\t\t\t\t\t\t" `shouldBe` "Fine. Be that way!"
           it "should respond 'Sure.' when input is a question" $ do
               responseForAdapter "Does this cryogenic chamber make me look fat?" `shouldBe` "Sure."
               responseForAdapter "You are, what, like 15?"                       `shouldBe` "Sure."
               responseForAdapter "fffbbcbeab?"                                   `shouldBe` "Sure."
               responseForAdapter "4?"                                            `shouldBe` "Sure."
               responseForAdapter ":) ?"                                          `shouldBe` "Sure."
               responseForAdapter "Wait! Hang on. Are you going to be OK?"        `shouldBe` "Sure."
               responseForAdapter "Okay if like my  spacebar  quite a bit?   "    `shouldBe` "Sure."
           it "should respond 'Whoa, chill out!' when input contains upper case letters and it is not a question" $ do
               responseForAdapter "WATCH OUT!"                        `shouldBe` "Whoa, chill out!"
               responseForAdapter "FCECDFCAAB"                        `shouldBe` "Whoa, chill out!"
               responseForAdapter "I HATE THE DMV"                    `shouldBe` "Whoa, chill out!"
               responseForAdapter "1, 2, 3 GO!"                       `shouldBe` "Whoa, chill out!"
               responseForAdapter "OMG THE %^*@#$(*^ ZOMBIES!!11!!1!" `shouldBe` "Whoa, chill out!"
           it "should respond 'Calm down, I know what I'm doing!' when input contains upper case letters and it is a question" $ do
               responseForAdapter "WHAT TIME IS IT?"                                 `shouldBe` "Calm down, I know what I'm doing!"
               responseForAdapter "WHAT THE HELL WERE YOU THINKING?"                 `shouldBe` "Calm down, I know what I'm doing!"
               responseForAdapter "OMG HAVE YOU SEEN THE %^*@#$(*^ ZOMBIES!!11!!1!?" `shouldBe` "Calm down, I know what I'm doing!"
           it "should respond 'Whatever.' when input is anything else" $ do
               responseForAdapter "Tom-ay-to, tom-aaaah-to."                             `shouldBe` "Whatever."
               responseForAdapter "Let's go make out behind the gym!"                    `shouldBe` "Whatever."
               responseForAdapter "It's OK if you don't want to go to the DMV."          `shouldBe` "Whatever."
               responseForAdapter "1, 2, 3"                                              `shouldBe` "Whatever."
               responseForAdapter "Ending with ? means a question."                      `shouldBe` "Whatever."
               responseForAdapter "\nDoes this cryogenic chamber make me look fat?\nNo." `shouldBe` "Whatever."
               responseForAdapter "         hmmmmmmm..."                                 `shouldBe` "Whatever."
               responseForAdapter "This is a statement ending with whitespace      "     `shouldBe` "Whatever."

responseForAdapter :: String -> String
responseForAdapter text = T.unpack $ responseFor $ T.pack text