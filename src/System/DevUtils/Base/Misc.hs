module System.DevUtils.Base.Misc (
 getLineLoop
) where

import Control.Monad (forever)

getLineLoop :: IO ()
getLineLoop = forever $ getLine
