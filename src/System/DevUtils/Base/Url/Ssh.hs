module System.DevUtils.Base.Url.Ssh (
 Ssh(..),
 defaultSshSession,
 defaultSsh
) where

import qualified System.DevUtils.Base.Url.Connection as C
import qualified System.DevUtils.Base.Url.Session as Ses

data Ssh = Ssh {
 _ses :: Ses.Session,
 _cmd :: Maybe String
} deriving (Show, Read)

defaultSshSession :: Ses.Session
defaultSshSession = Ses.Session {
 Ses._auth = Nothing,
 Ses._con = C.Connection {
  C._dest = "localhost", C._port = 22, C._type = C.TCP }
 }

defaultSsh :: Ssh
defaultSsh = Ssh {
 _ses = defaultSshSession,
 _cmd = Nothing
 }
