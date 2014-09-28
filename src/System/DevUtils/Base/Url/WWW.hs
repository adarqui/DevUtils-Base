module System.DevUtils.Base.Url.WWW (
 WWW(..),
 defaultWWWConnection,
 defaultWWW
) where

import qualified System.DevUtils.Base.Url.Connection as C

data WWW = WWW {
 _con :: C.Connection
} deriving (Show, Read)

defaultWWWConnection :: C.Connection
defaultWWWConnection = C.Connection {
  C._dest = "localhost", C._port = 80, C._type = C.TCP
 }

defaultWWW :: WWW
defaultWWW = WWW {
  _con = defaultWWWConnection
 }
