misc:
=====

```
:set -XOverloadedStrings
import qualified Data.ByteString.Lazy as B
ebs <- B.readFile "etc/Cloud/Amazon/Pricing/EBS.json" 
eitherDecode ebs :: Either String EBSRoot
```
