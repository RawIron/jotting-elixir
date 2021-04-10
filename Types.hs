module Main where
{-
 - some terms about the type system
 -   function type
 -   data type
 -   type variable
 -   type constructor
 -   type constructor function
 -   concrete type
 -   type class
 -   polymorphic
 -   overloaded
 -}

-- positional
type FirstName = String
type LastName = String
data Name = Name FirstName LastName

-- struct-like
data Reward = Reward {name :: String, amount :: Int}

-- recursive
data BinaryTree a = Leaf a | Node (BinaryTree a) a (BinaryTree a)


main :: IO ()
main = do
  let
    motoko = Name "Motoko" "Kusanagi"
    daily = Reward {name = "Daily Reward", amount = 100}
    leaderb = Node (Leaf 4) 4 (Node (Leaf 6) 8 (Leaf 12))
  putStrLn $ name daily
