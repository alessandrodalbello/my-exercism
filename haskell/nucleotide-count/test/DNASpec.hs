import Data.Either       (isLeft)
import Data.Map          (Map, findWithDefault)
import Test.Hspec        (Expectation, Spec, describe, hspec, it, shouldBe, shouldSatisfy)

import DNA (nucleotideCounts, Nucleotide(..))

main :: IO ()
main = hspec specs

specs :: Spec
specs = describe "nucleotideCounts" $ do
            it "should handle empty DNA strand" $
              nucleotideCounts "" `matchesMap` [ (A, 0), (C, 0), (G, 0), (T, 0) ]
            it "should count one nucleotide in single-character DNA strands" $ do
              nucleotideCounts "A" `matchesMap` [ (A, 1), (C, 0), (G, 0), (T, 0) ]
              nucleotideCounts "C" `matchesMap` [ (A, 0), (C, 1), (G, 0), (T, 0) ]
              nucleotideCounts "G" `matchesMap` [ (A, 0), (C, 0), (G, 1), (T, 0) ]
              nucleotideCounts "T" `matchesMap` [ (A, 0), (C, 0), (G, 0), (T, 1) ]
            it "should count repetitive sequences of nucleotides" $ do
              nucleotideCounts "GGGGGGGG"   `matchesMap` [ (A, 0), (C, 0), (G, 8), (T, 0) ]
              nucleotideCounts "AAAACCCCCC" `matchesMap` [ (A, 4), (C, 6), (G, 0), (T, 0) ]
            it "should count all nucleotides of valid DNA strands" $
              nucleotideCounts "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
              `matchesMap` [ (A, 20), (C, 12), (G, 17), (T, 21) ]
            it "should be case-insensitive when counting nucleotides of valid DNA strands" $
              nucleotideCounts "agcttttcattctgactgcaacgggcaatatgtctctgtgtggattaaaaaaagagtgtctgatagcagc"
              `matchesMap` [ (A, 20), (C, 12), (G, 17), (T, 21) ]
            it "should validate strands and discard invalid ones" $ do
              nucleotideCounts "AGXXACT"                `shouldSatisfy` isLeft
              nucleotideCounts "ctTGAAyGTaaG"           `shouldSatisfy` isLeft
              nucleotideCounts "GTAAGTACTTACTXACGGGACG" `shouldSatisfy` isLeft

matchesMap:: Either String (Map Nucleotide Int) -> [(Nucleotide, Int)] -> Expectation
matchesMap actual@(Left _) _ = shouldSatisfy actual (const False)
matchesMap actual@(Right count) expected = shouldSatisfy actual (\_ -> and [ findWithDefault 0 n count == c | (n,c) <- expected ])