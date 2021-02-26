module Main where


data Card a = Card a a deriving (Show)

power :: (Num a) => Card a -> Card a -> Card a
power (Card k l) (Card m n) = Card (k+m) (l+n)

instance (Num a) => Semigroup (Card a) where
  (<>) = power


main :: IO ()
main = do
  let king = Card 2 3
      queen = Card 1 3
      royal = king <> queen
  putStrLn $ show royal