module System.DevUtils.Base.Data.Map (
 kvListToMap
) where

import qualified Data.List as L
import qualified Data.Map as M

kvListToMap :: (Ord a) => [(a,b)] -> M.Map a b
kvListToMap xl = M.fromList xl
