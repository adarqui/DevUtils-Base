module System.DevUtils.Base.Url.Memcache (
 Memcache(..),
 defaultMemcacheSession,
 defaultMemcache
) where

import qualified System.DevUtils.Base.Url.Connection as C
import qualified System.DevUtils.Base.Url.Session as Ses

data Memcache = Memcache {
 _ses :: Ses.Session,
 _custom :: Maybe String
} deriving (Show, Read)

defaultMemcacheSession :: Ses.Session
defaultMemcacheSession = Ses.Session {
 Ses._auth = Nothing,
 Ses._con = C.Connection {
  C._dest = "localhost", C._port = 11211, C._type = C.TCP }
 }

defaultMemcache :: Memcache
defaultMemcache = Memcache {
  _ses = defaultMemcacheSession,
  _custom = Nothing
 }
