module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Empty | Node a (BST a) (BST a)
            deriving (Eq, Show)

bstValue :: BST a -> Maybe a
bstValue Empty        = Nothing
bstValue (Node v _ _) = Just v

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty        = Nothing
bstLeft (Node _ l _) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight Empty        = Nothing
bstRight (Node _ _ r) = Just r

empty :: BST a
empty = Empty

singleton :: a -> BST a
singleton v = Node v Empty Empty

insert :: Ord a => a -> BST a -> BST a
insert v Empty = singleton v
insert v (Node w l r)
    | v <= w    = Node w (insert v l) r
    | otherwise = Node w l (insert v r)

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) Empty

toList :: BST a -> [a]
toList Empty        = []
toList (Node v l r) = toList l ++ [v] ++ toList r
