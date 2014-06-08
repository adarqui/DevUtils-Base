module System.DevUtils.Base.Control.Monad (
 concatMapM
 ) where

import Control.Monad (liftM)

concatMapM :: Monad m => (a -> m [b]) -> [a] -> m [b]
concatMapM f xs = liftM concat (mapM f xs)
