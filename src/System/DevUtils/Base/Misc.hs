module System.DevUtils.Base.Misc (
 getLineLoop,
 readMaybe
) where

import Control.Monad (forever)

getLineLoop :: IO ()
getLineLoop = forever $ getLine

readMaybe :: (Read a) => String -> Maybe a
readMaybe s = case reads s of
              [(x, "")] -> Just x
              _ -> Nothing
