module System.DevUtils.Base.Network (
 portFromWord
) where

import Network
import Data.Word

portFromWord :: Word16 -> PortID
portFromWord word = PortNumber $ fromIntegral word
