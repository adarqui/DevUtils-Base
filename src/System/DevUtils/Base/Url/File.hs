module System.DevUtils.Base.Url.File (
 File(..),
 defaultFile
) where

import qualified System.DevUtils.Base.Url.Connection as C
import qualified System.DevUtils.Base.Url.Session as Ses

data File = File {
 _path :: FilePath
} deriving (Show, Read)

defaultFile :: File
defaultFile = File {
  _path = "/tmp/poop"
 }
