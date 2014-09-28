module System.DevUtils.Base.Url.Memcache (
 Memcache(..),
 defaultMemcacheConnection,
 defaultMemcache
) where

import qualified System.DevUtils.Base.Url.Connection as C

data Memcache = Memcache {
 _con :: C.Connection
} deriving (Show, Read)

defaultMemcacheConnection :: C.Connection
defaultMemcacheConnection = C.Connection {
  C._dest = "localhost", C._port = 11211, C._type = C.TCP
 }

defaultMemcache :: Memcache
defaultMemcache = Memcache {
  _con = defaultMemcacheConnection
 }
