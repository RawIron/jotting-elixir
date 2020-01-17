module Main where

{-# LANGUAGE OverloadedStrings #-}

import Data.Text as T
-- convert String to Text
-- convert Text to String
import qualified Data.Text.Conversions as TC

import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Test.QuickCheck
import Test.QuickCheck.Instances
import Test.HUnit

isPalindrom :: Text -> Bool
isPalindrom word = word == T.reverse word


prop_reverseInvariant word = isPalindrom word == (isPalindrom $ T.reverse word)

test_palindrome_hello = (not . isPalindrom $ TC.convertText "(hello)") @?= True
test_palindrome_ollo =  (isPalindrom $ TC.convertText "$ollo$") @?= True

tests = [
         testProperty "reverse word == word" prop_reverseInvariant,
         testCase "hello fails" test_palindrome_hello,
         testCase "ollo passes" test_palindrome_ollo
        ]

main :: IO ()
main = defaultMain tests
