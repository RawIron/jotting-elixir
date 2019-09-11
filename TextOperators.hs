module Main where

{-# LANGUAGE OverloadedStrings #-}

import Data.Text as T
import Data.List as L
import Prelude as P
-- convert String to Text
-- convert Text to String
import Data.Text.Conversions as TC

isPalindrom :: Text -> Bool
isPalindrom word = word == T.reverse word

chainBracket :: [Int] -> Int
chainBracket counters = ((+1) . L.head) counters

chainDot :: [Int] -> Int
chainDot counters = (+1) $ L.head counters


main :: IO ()
main = do
  let c = chainBracket [2,4]
  let d = chainDot [4,4]
  print (c,d)
  let a = (isPalindrom . convertText) "hello"
  print (a)
