module Main where

import Data.List as L
import Test.HUnit

chainBracket :: [Int] -> Int
chainBracket counters = ((+1) . L.head) counters

chainDot :: [Int] -> Int
chainDot counters = (+1) $ L.head counters

test_bracket = TestCase (assertEqual "compose with brackets" (chainBracket [2,4]) 3)
test_dollar = TestCase (assertEqual "compose with $" (chainDot [4,4]) 5)
tests = TestList [test_bracket, test_dollar]

main :: IO ()
main = do
  runTestTT tests
  return ()
