module System.DevUtils.Base.Url.Auth (
 Auth(..),
 defaultAuth
) where

data Auth = Auth {
 _user :: String,
 _pass :: Maybe String
} deriving (Show, Read)

defaultAuth :: Auth
defaultAuth = Auth { _user = "unknown", _pass = Nothing }
