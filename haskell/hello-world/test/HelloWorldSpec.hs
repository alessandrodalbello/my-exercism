import Test.Hspec (Spec, describe, hspec, it, shouldBe)
import HelloWorld (hello)

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "hello" $
          it "should greet the world" $
            hello `shouldBe` "Hello, World!"
