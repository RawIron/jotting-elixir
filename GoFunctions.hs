module Main where
--module Go.Functions where
-- 
-- The GO Programming Language
-- Chapter 5
-- Functions
--

hypot :: Double -> Double -> Double
hypot x y = sqrt (x*x + y*y)

zero :: Int -> Int -> Int
zero _ _ = 0

squares :: [Int]
squares = map (\x -> x*x) [1..]

type Medals = [String]
medals :: Medals
medals = ["gold", "silver", "bronze"]
listMedals :: Medals
listMedals = reverse medals


main :: IO ()
main = do
  print $ hypot 2.0 2.0
  print $ take 4 squares
  print $ take 1 squares
  print listMedals
  return ()
