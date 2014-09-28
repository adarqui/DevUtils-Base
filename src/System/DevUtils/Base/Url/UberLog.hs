module System.DevUtils.Base.Url.UberLog (
 UberLog(..),
 defaultUberLogConnection,
 defaultUberLog
) where

import System.DevUtils.Base.Url.WWW

import qualified System.DevUtils.Base.Url.Connection as C

type UberLog = WWW

defaultUberLogConnection :: C.Connection
defaultUberLogConnection = C.Connection {
  C._dest = "localhost", C._port = 9876, C._type = C.TCP
 }

defaultUberLog :: UberLog
defaultUberLog = WWW {
  _con = defaultUberLogConnection
 }
