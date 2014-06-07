module System.DevUtils.Base.Url.Connection (
 Connection(..),
 ConnectionType(..),
 defaultConnection
) where

data ConnectionType = TCP | UDP | INET | UNIX | UNKNOWN deriving (Show, Read)

data Connection = Connection {
 _dest :: String,
 _port :: Integer,
 _type :: ConnectionType
} deriving (Show, Read)

defaultConnection :: Connection
defaultConnection = Connection { _dest = "127.0.0.1", _port = 0, _type = UNKNOWN }
