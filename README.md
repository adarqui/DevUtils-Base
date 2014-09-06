aws misc:
=========

EBS
--

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.EBS
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ebs <- B.readFile "etc/Cloud/Amazon/Pricing/EBS.json" 
eitherDecode ebs :: Either String EBSRoot
```

EC2
--

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.EC2
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ec2 <- B.readFile "etc/Cloud/Amazon/Pricing/EC2-Linux-OnDemand.json" 
eitherDecode ec2 :: Either String EC2Root
```

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.EC2.Reserved
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ec2 <- B.readFile "etc/Cloud/Amazon/Pricing/EC2-Linux-RI-Light.json" 
eitherDecode ec2 :: Either String EC2Root
ec2 <- B.readFile "etc/Cloud/Amazon/Pricing/EC2-Linux-DI-RI-Light.json" 
eitherDecode ec2 :: Either String EC2Root
```

ElasticCache
--

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.ElasticCache
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ec <- B.readFile "etc/Cloud/Amazon/Pricing/ElasticCache-Cleaned-Standard.json"
eitherDecode ec :: Either String ECRoot
```

:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.ElasticCache.Reserved
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ec <- B.readFile "etc/Cloud/Amazon/Pricing/ElasticCache-Cleaned-RI-Heavy-Standard.json"
eitherDecode ec :: Either String ECRoot


RDS
--

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.RDS
import qualified Data.ByteString.Lazy as B
import Data.Aeson
rds <- B.readFile "etc/Cloud/Amazon/Pricing/RDS-MySQL-Standard.json"
eitherDecode rds :: Either String RDSRoot
```

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.RDS.Reserved
import qualified Data.ByteString.Lazy as B
import Data.Aeson
rds <- B.readFile "etc/Cloud/Amazon/Pricing/RDS-MySQL-Reserved-Heavy.json"
eitherDecode rds :: Either String RDSRoot
```
