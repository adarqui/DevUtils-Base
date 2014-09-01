aws misc:
=========

```
:set -XOverloadedStrings
import qualified Data.ByteString.Lazy as B
ebs <- B.readFile "etc/Cloud/Amazon/Pricing/EBS.json" 
eitherDecode ebs :: Either String EBSRoot
```

```
:set -XOverloadedStrings
import qualified Data.ByteString.Lazy as B
ec2 <- B.readFile "etc/Cloud/Amazon/Pricing/EC2-Linux-OnDemand.json" 
eitherDecode ec2 :: Either String EC2Root
```
