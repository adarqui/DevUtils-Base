module System.DevUtils.Base.Url.MySQL (
 MySQL(..),
 defaultMySQLSession,
 defaultMySQL
) where

import qualified System.DevUtils.Base.Url.Connection as C
import qualified System.DevUtils.Base.Url.Session as Ses

data MySQL = MySQL {
 _ses :: Ses.Session,
 _db :: Maybe String,
 _custom :: Maybe String
} deriving (Show, Read)

defaultMySQLSession :: Ses.Session
defaultMySQLSession = Ses.Session {
 Ses._auth = Nothing,
 Ses._con = C.Connection {
  C._dest = "localhost", C._port = 3306, C._type = C.TCP }
 }

defaultMySQL :: MySQL
defaultMySQL = MySQL {
  _ses = defaultMySQLSession,
  _db = Nothing,
  _custom = Nothing
 }
