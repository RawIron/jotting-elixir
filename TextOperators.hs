module Main where

{-# LANGUAGE OverloadedStrings #-}

import Data.Text as T
import Data.List as L
import Prelude as P
-- convert String to Text
-- convert Text to String
import qualified Data.Text.Conversions as TC

isPalindrom :: Text -> Bool
isPalindrom word = word == T.reverse word

chainBracket :: [Int] -> Int
chainBracket counters = ((+1) . L.head) counters

chainDot :: [Int] -> Int
chainDot counters = (+1) $ L.head counters


testChain:: IO ()
testChain = do
  let c = chainBracket [2,4]
  let d = chainDot [4,4]
  print (c,d)

testPalindrome :: IO ()
testPalindrome = do
  let a = (isPalindrom . TC.convertText) "(hello)"
  print (a)
  let b = isPalindrom $ TC.convertText "$ollo$"
  print (b)

main :: IO ()
main = do
  testChain
  testPalindrome
