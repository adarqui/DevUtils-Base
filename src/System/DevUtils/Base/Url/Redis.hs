module System.DevUtils.Base.Url.Redis (
 Redis(..),
 defaultRedisSession,
 defaultRedis
) where

import qualified System.DevUtils.Base.Url.Auth as A
import qualified System.DevUtils.Base.Url.Connection as C
import qualified System.DevUtils.Base.Url.Session as Ses

data Redis = Redis {
 _ses :: Ses.Session,
 _db :: Integer,
 _prefix :: Maybe String,
 _pool :: Integer,
 _idle :: Integer,
 _custom :: Maybe String
} deriving (Show, Read)

defaultRedisSession :: Ses.Session
defaultRedisSession = Ses.Session {
 Ses._auth = Nothing,
 Ses._con = C.Connection {
  C._dest = "localhost", C._port = 6379, C._type = C.TCP }
 }

defaultRedis :: Redis
defaultRedis = Redis {
  _ses = defaultRedisSession,
  _db = 0,
  _prefix = Nothing,
  _pool = 50,
  _idle = 30,
  _custom = Nothing
 }
