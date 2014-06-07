module System.DevUtils.Base.Url.Field (
 Fields(..)
) where

data Fields = Fields {
 _delim :: String,
 _memb :: [String]
} deriving (Show, Read)
