module Main where

import Data.List as L
import Test.HUnit

chainBracket :: [Int] -> Int
chainBracket counters = ((+1) . L.head) counters

chainDollar :: [Int] -> Int
chainDollar counters = (+1) $ L.head counters

test_bracket = assertEqual "compose with brackets" (chainBracket [2,4]) 3
test_dollar = assertEqual "compose with $" (chainDollar [4,4]) 5
tests = TestList $ TestCase <$> [test_bracket, test_dollar]

main :: IO ()
main = do
  runTestTT tests
  return ()
