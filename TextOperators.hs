module Main where

{-# LANGUAGE OverloadedStrings #-}

import Data.Text as T
-- convert String to Text
-- convert Text to String
import qualified Data.Text.Conversions as TC

import Test.QuickCheck
import Test.QuickCheck.Instances
import Test.HUnit

isPalindrom :: Text -> Bool
isPalindrom word = word == T.reverse word


prop_reverseInvariant word = isPalindrom word == (isPalindrom $ T.reverse word)

test_palindrome_fail = TestCase (assertBool "hello should fail" (not . isPalindrom $ TC.convertText "(hello)"))
test_palindrome_ok = TestCase (assertBool "ollo should pass" (isPalindrom $ TC.convertText "$ollo$"))
tests = TestList [test_palindrome_fail, test_palindrome_ok]

main :: IO ()
main = do
  quickCheck prop_reverseInvariant
  runTestTT tests
  print ""
