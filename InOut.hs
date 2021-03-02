module Main where


input :: IO [String]
input =
  getContents >>= return . words


main :: IO ()
main = do
  input >>= mapM_ putStrLn
