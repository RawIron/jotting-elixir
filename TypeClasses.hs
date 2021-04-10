{-# LANGUAGE FlexibleInstances #-}

module Main where


data Card a = Card a a deriving (Show)

power :: (Num a) => Card a -> Card a -> Card a
power (Card k l) (Card m n) = Card (k+m) (l+n)

instance (Num a) => Semigroup (Card a) where
  (<>) = power


class (Read a) => GetMany a where
  getMany :: IO [a]

instance GetMany Int where
  getMany = do
    _ <- read <$> getLine :: IO Int
    (map read . words) <$> getLine

instance GetMany String where
  getMany = do
    _ <- read <$> getLine :: IO Int
    words <$> getLine


main :: IO ()
main = do
  let king = Card 2 3
      queen = Card 1 3
      royal = king <> queen
  putStrLn $ show royal

  names <- getMany :: IO [String]
  mapM_ putStrLn names

  numbers <- getMany :: IO [Int]
  mapM_ (putStrLn . show) numbers
