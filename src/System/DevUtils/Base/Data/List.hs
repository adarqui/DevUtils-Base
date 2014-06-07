module System.DevUtils.Base.Data.List (
 split,
 splitBy
) where

split :: (Eq a) => a -> [a] -> [[a]]
split d l = splitBy (/= d) l

splitBy :: (Eq a) => (a -> Bool) -> [a] -> [[a]]
splitBy _ [] = []
splitBy f l = h :
 case t of
  [] -> []
  _ -> splitBy f (tail t)
 where
  (h, t) = (takeWhile f l, dropWhile f l)
