module System.DevUtils.Base.Url.Session (
 Session(..),
 defaultSession
) where

import qualified System.DevUtils.Base.Url.Auth as A
import qualified System.DevUtils.Base.Url.Connection as C

data Session = Session {
 _auth :: Maybe A.Auth,
 _con :: C.Connection
} deriving (Show, Read)

defaultSession :: Session
defaultSession = Session { _auth = Nothing, _con = C.defaultConnection }
