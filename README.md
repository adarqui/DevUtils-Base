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
import System.DevUtils.Base.Cloud.Amazon.EC2
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ec2 <- B.readFile "etc/Cloud/Amazon/Pricing/EC2-Linux-DI-OnDemand.json" 
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

ElastiCache
--

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.ElastiCache
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ec <- B.readFile "etc/Cloud/Amazon/Pricing/ElastiCache-Cleaned-Standard.json"
eitherDecode ec :: Either String ECRoot
```

:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.ElastiCache.Reserved
import qualified Data.ByteString.Lazy as B
import Data.Aeson
ec <- B.readFile "etc/Cloud/Amazon/Pricing/ElastiCache-Cleaned-RI-Heavy-Standard.json"
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

```
:set -XOverloadedStrings
import System.DevUtils.Base.Cloud.Amazon.S3
import qualified Data.ByteString.Lazy as B
import Data.Aeson
s3 <- B.readFile "etc/Cloud/Amazon/Pricing/S3.json"
eitherDecode s3 :: Either String S3Root
```

```
import System.DevUtils.Base.Cloud.Amazon
j <- populate defaultJSONLocations
```

```
import Control.Monad
import System.DevUtils.Base.Cloud.Amazon
liftM generalize $  populate defaultJSONLocations
