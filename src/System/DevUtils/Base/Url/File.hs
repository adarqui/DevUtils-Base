module System.DevUtils.Base.Url.File (
 File(..),
 defaultFile
) where

data File = File {
 _path :: FilePath
} deriving (Show, Read)

defaultFile :: File
defaultFile = File {
  _path = "/tmp/poop"
 }
