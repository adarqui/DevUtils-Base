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
k <- liftM generalize $ populate defaultJSONLocations
import Data.List
nub $ sort $ map (\p -> fam p) k
nub $ sort $ map (\p -> name p) k
nub $ sort $ map (\p -> rate'type p) k
```

```
 nub $ sort $ map (\p -> name p) k
["c1.medium","c1.xlarge","c3.2xlarge","c3.4xlarge","c3.8xlarge","c3.large","c3.xlarge","cc2.8xlarge","cg1.4xlarge","cr1.8xlarge","ebsPIOPSVols","ebsSnapsToS3","ebsVols","g2.2xlarge","hi1.4xlarge","hs1.8xlarge","i2.2xlarge","i2.4xlarge","i2.8xlarge","i2.xlarge","m1.large","m1.medium","m1.small","m1.xlarge","m2.2xlarge","m2.4xlarge","m2.xlarge","m3.2xlarge","m3.large","m3.medium","m3.xlarge","t1.micro"]
```

```
nub $ sort $ map (\p -> rate'type p) k
["di-heavy-y1","di-heavy-y3","di-light-y1","di-light-y3","di-medium-y1","di-medium-y3","onDemand","perGBmoDataStored","perGBmoProvStorage","perMMIOreq","perPIOPSreq","ri-heavy-y1","ri-heavy-y3","ri-light-y1","ri-light-y3","ri-medium-y1","ri-medium-y3"]
```
