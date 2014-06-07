module System.DevUtils.Base.Url.ZMQ (
 ZMQ(..),
 defaultZMQConnection,
 defaultZMQ
) where

import qualified System.DevUtils.Base.Url.Connection as C

data ZMQ = ZMQ {
 _con :: C.Connection
} deriving (Show, Read)

defaultZMQConnection :: C.Connection
defaultZMQConnection = C.Connection {
  C._dest = "localhost", C._port = 0, C._type = C.TCP
 }

defaultZMQ :: ZMQ
defaultZMQ = ZMQ {
  _con = defaultZMQConnection
 }
