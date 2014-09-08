{-# LANGUAGE OverloadedStrings, RecordWildCards #-}

-- parsing all of this pricing information is pretty brutal...

-- ... this is disgusting.. sorry.

module System.DevUtils.Base.Cloud.Amazon (
 JSONLocations (..),
 Pricing (..),
 GeneralPricing (..),
 populate,
 defaultJSONLocations,
 generalize,
 ec2ToGP,
 ec2ToGP'ri'or'di,
 ebsToGP,
 rdsToGP,
 rdsToGP'ri'or'di,
 ecToGP,
 ecToGP'ri'or'di,
 s3ToGP
) where

import qualified System.DevUtils.Base.Cloud.Amazon.EC2 as EC2
import qualified System.DevUtils.Base.Cloud.Amazon.EC2.Reserved as EC2Reserved
import qualified System.DevUtils.Base.Cloud.Amazon.ElastiCache as EC
import qualified System.DevUtils.Base.Cloud.Amazon.ElastiCache.Reserved as ECReserved
import qualified System.DevUtils.Base.Cloud.Amazon.EBS as EBS
import qualified System.DevUtils.Base.Cloud.Amazon.RDS as RDS
import qualified System.DevUtils.Base.Cloud.Amazon.RDS.Reserved as RDSReserved
import qualified System.DevUtils.Base.Cloud.Amazon.S3 as S3
import qualified System.DevUtils.Base.Cloud.Amazon.Misc

import System.DevUtils.Base.Cloud.Amazon.Misc

import qualified Data.ByteString.Lazy as B
import Data.Aeson
import Data.Maybe
import Data.Char

data JSONLocations = JSONLocations {
 ebsPath :: FilePath,
 ec2Path'onDemand :: FilePath,
 ec2ReservedPath'Light :: FilePath,
 ec2ReservedPath'Medium :: FilePath,
 ec2ReservedPath'Heavy :: FilePath,
 ec2DedicatedPath'onDemand :: FilePath,
 ec2DedicatedPath'Light :: FilePath,
 ec2DedicatedPath'Medium :: FilePath,
 ec2DedicatedPath'Heavy :: FilePath,
 ecPath'onDemand :: FilePath,
 ecReservedPath'Light :: FilePath,
 ecReservedPath'Medium :: FilePath,
 ecReservedPath'Heavy :: FilePath,
 rdsPath'onDemand :: FilePath,
 rdsReservedPath'Light :: FilePath,
 rdsReservedPath'Medium :: FilePath,
 rdsReservedPath'Heavy :: FilePath,
 s3Path :: FilePath
} deriving (Show, Read)

-- everything per hr
data GeneralPricing = GeneralPricing {
 fam :: String,
 region :: String,
 name :: String,
 rate'type :: String,
 upfront :: Double,
 rate :: Double 
} deriving (Show, Read, Eq, Ord)

data Pricing = Pricing {
 ebs :: EBS.EBSRoot,
 ec2'onDemand :: EC2.EC2Root,
 ec2'ri'light :: EC2Reserved.EC2Root,
 ec2'ri'medium :: EC2Reserved.EC2Root,
 ec2'ri'heavy :: EC2Reserved.EC2Root,
 ec2'di'onDemand :: EC2Reserved.EC2Root,
 ec2'di'light :: EC2Reserved.EC2Root,
 ec2'di'medium :: EC2Reserved.EC2Root,
 ec2'di'heavy :: EC2Reserved.EC2Root,
 ec'onDemand :: EC.ECRoot,
 ec'ri'light :: ECReserved.ECRoot,
 ec'ri'medium :: ECReserved.ECRoot,
 ec'ri'heavy :: ECReserved.ECRoot,
 rds'onDemand :: RDS.RDSRoot,
 rds'ri'light :: RDSReserved.RDSRoot,
 rds'ri'medium :: RDSReserved.RDSRoot,
 rds'ri'heavy :: RDSReserved.RDSRoot,
 s3 :: S3.S3Root
} deriving (Show, Read)

defaultJSONLocations = JSONLocations {
 ebsPath = p "EBS",
 ec2Path'onDemand = p "EC2-Linux-OnDemand",
 ec2ReservedPath'Light = p "EC2-Linux-RI-Light",
 ec2ReservedPath'Medium = p "EC2-Linux-RI-Medium",
 ec2ReservedPath'Heavy = p "EC2-Linux-RI-Heavy",
 ec2DedicatedPath'onDemand = p "EC2-Linux-OnDemand",
 ec2DedicatedPath'Light = p "EC2-Linux-DI-RI-Light",
 ec2DedicatedPath'Medium = p "EC2-Linux-DI-RI-Medium",
 ec2DedicatedPath'Heavy = p "EC2-Linux-DI-RI-Heavy",
 ecPath'onDemand = p "ElastiCache-Cleaned-Standard",
 ecReservedPath'Light = p "ElastiCache-Cleaned-RI-Light-Standard",
 ecReservedPath'Medium = p "ElastiCache-Cleaned-RI-Medium-Standard",
 ecReservedPath'Heavy = p "ElastiCache-Cleaned-RI-Heavy-Standard",
 rdsReservedPath'Light = p "RDS-MySQL-Reserved-Light",
 rdsReservedPath'Medium = p "RDS-MySQL-Reserved-Medium",
 rdsReservedPath'Heavy = p "RDS-MySQL-Reserved-Heavy",
 rdsPath'onDemand = p "RDS-MySQL-Standard",
 s3Path = p "S3"
}
 where
  p s = "etc/Cloud/Amazon/Pricing/" ++ s ++ ".json"

populate JSONLocations{..} = do
 _ebs <- B.readFile ebsPath
 _ec2'onDemand <- B.readFile ec2Path'onDemand
 _ec2'ri'light <- B.readFile ec2ReservedPath'Light
 _ec2'ri'medium <- B.readFile ec2ReservedPath'Medium
 _ec2'ri'heavy <- B.readFile ec2ReservedPath'Heavy
 _ec2'di'light <- B.readFile ec2DedicatedPath'Light
 _ec2'di'medium <- B.readFile ec2DedicatedPath'Medium
 _ec2'di'heavy <- B.readFile ec2DedicatedPath'Heavy
 _ec'onDemand <- B.readFile ecPath'onDemand
 _ec'ri'light <- B.readFile ecReservedPath'Light
 _ec'ri'medium <- B.readFile ecReservedPath'Medium
 _ec'ri'heavy <- B.readFile ecReservedPath'Heavy
 _rds'onDemand <- B.readFile rdsPath'onDemand
 _rds'ri'light <- B.readFile rdsReservedPath'Light
 _rds'ri'medium <- B.readFile rdsReservedPath'Medium
 _rds'ri'heavy <- B.readFile rdsReservedPath'Heavy
 _s3 <- B.readFile s3Path
 return $ Pricing {
  ebs = fromJust (decode' _ebs :: Maybe EBS.EBSRoot),
  ec2'onDemand = fromJust (decode' _ec2'onDemand :: Maybe EC2.EC2Root),
  ec2'ri'light = fromJust (decode' _ec2'ri'light :: Maybe EC2Reserved.EC2Root),
  ec2'ri'medium = fromJust (decode' _ec2'ri'medium :: Maybe EC2Reserved.EC2Root),
  ec2'ri'heavy = fromJust (decode' _ec2'ri'heavy :: Maybe EC2Reserved.EC2Root),
  ec2'di'onDemand = fromJust (decode' _ec2'di'light :: Maybe EC2Reserved.EC2Root),
  ec2'di'light = fromJust (decode' _ec2'di'light :: Maybe EC2Reserved.EC2Root),
  ec2'di'medium = fromJust (decode' _ec2'di'medium :: Maybe EC2Reserved.EC2Root),
  ec2'di'heavy = fromJust (decode' _ec2'di'heavy :: Maybe EC2Reserved.EC2Root),
  ec'onDemand = fromJust (decode' _ec'onDemand :: Maybe EC.ECRoot),
  ec'ri'light = fromJust (decode' _ec'ri'light :: Maybe ECReserved.ECRoot),
  ec'ri'medium = fromJust (decode' _ec'ri'medium :: Maybe ECReserved.ECRoot),
  ec'ri'heavy = fromJust (decode' _ec'ri'heavy :: Maybe ECReserved.ECRoot),
  rds'onDemand = fromJust (decode' _rds'onDemand :: Maybe RDS.RDSRoot),
  rds'ri'light = fromJust (decode' _rds'ri'light :: Maybe RDSReserved.RDSRoot),
  rds'ri'medium = fromJust (decode' _rds'ri'medium :: Maybe RDSReserved.RDSRoot),
  rds'ri'heavy = fromJust (decode' _rds'ri'heavy :: Maybe RDSReserved.RDSRoot),
  s3 = fromJust (decode' _s3 :: Maybe S3.S3Root)
 }

generalize :: Pricing -> [GeneralPricing]
generalize Pricing{..} =
 concat
  [
   ec2ToGP ec2'onDemand,
   ec2ToGP'ri'or'di ec2'ri'light "ri-light-",
   ec2ToGP'ri'or'di ec2'ri'medium "ri-medium-",
   ec2ToGP'ri'or'di ec2'ri'heavy "ri-heavy-",
   ec2ToGP'ri'or'di ec2'di'light "di-light-",
   ec2ToGP'ri'or'di ec2'di'medium "di-medium-",
   ec2ToGP'ri'or'di ec2'di'heavy "di-heavy-",
   ebsToGP ebs,
   ecToGP ec'onDemand,
   ecToGP'ri'or'di ec'ri'light "ri-light-",
   ecToGP'ri'or'di ec'ri'medium "ri-medium-",
   ecToGP'ri'or'di ec'ri'heavy "ri-heavy-",
   rdsToGP rds'onDemand,
   rdsToGP'ri'or'di rds'ri'light "ri-light-",
   rdsToGP'ri'or'di rds'ri'medium "ri-medium-",
   rdsToGP'ri'or'di rds'ri'heavy "ri-heavy-",
   s3ToGP s3
  ]

ec2ToGP ec2 =
 concat $ concat $ map (\region ->
  map (\instanceType ->
   map (\size ->
    GeneralPricing { fam = "ec2", region = EC2.region region, name = EC2.size size, rate'type = "onDemand", upfront = 0.0, rate = readCurrency (usd $ EC2.prices $ head $ EC2.valueColumns size) }
   ) $ EC2.sizes instanceType
  ) $ EC2.instanceType region
 ) $ EC2.regions $ EC2.config ec2

ec2ToGP'ri'or'di ec2 rate'type'prefix =
 concat $ concat $ concat $ map (\region ->
  map (\instanceType ->
   map (\size ->
    let
     v = EC2Reserved.valueColumns size
     y1 = v !! 0
     y1hr = v !! 1
     y3 = v !! 2 
     y3hr = v !! 3
    in
     case (any (\x -> (usd $ EC2Reserved.prices x) =="N/A") v) of
      True -> []
      otherwise ->
       [GeneralPricing { fam = "ec2", region = EC2Reserved.region region, name = EC2Reserved.size size, rate'type = rate'type'prefix ++ "y1", upfront = readCurrency (usd $ EC2Reserved.prices y1), rate = readCurrency (usd $ EC2Reserved.prices y1hr) },
       GeneralPricing { fam = "ec2", region = EC2Reserved.region region, name = EC2Reserved.size size, rate'type = rate'type'prefix ++ "y3", upfront = readCurrency (usd $ EC2Reserved.prices y3), rate = readCurrency (usd $ EC2Reserved.prices y3hr) }]
   ) $ EC2Reserved.sizes instanceType
  ) $ EC2Reserved.instanceType region
 ) $ EC2Reserved.regions $ EC2Reserved.config ec2

ebsToGP ebs =
 concat $ concat $ map (\region ->
  map (\types ->
   map (\values ->
    GeneralPricing { fam = "ebs", region = EBS.region region, name = EBS.name types, rate'type = EBS.rateV values, upfront = 0.0, rate = readCurrency (usd $ EBS.prices values) }
   ) $ EBS.values types
  ) $ EBS.types region
 ) $ EBS.regions $ EBS.config ebs

rdsToGP rds =
 concat $ concat $ map (\region ->
  map (\types ->
   map (\tier ->
    GeneralPricing { fam = "rds", region = RDS.region region, name = RDS.name tier, rate'type = "onDemand", upfront = 0.0, rate = readCurrency (usd $ RDS.prices tier) }
   ) $ RDS.tiers types
  ) $ RDS.types region
 ) $ RDS.regions $ RDS.config rds

rdsToGP'ri'or'di rds rate'type'prefix =
 concat $ concat $ concat $ map (\region ->
  map (\instanceType ->
   map (\size ->
    let
     v = RDSReserved.valueColumns size
     y1 = v !! 0
     y1hr = v !! 1
     y3 = v !! 2 
     y3hr = v !! 3
    in
     case (any (\x -> (usd $ RDSReserved.prices x) =="N/A") v) of
      True -> []
      otherwise ->
       [GeneralPricing { fam = "rds", region = RDSReserved.region region, name = RDSReserved.size size, rate'type = rate'type'prefix ++ "y1", upfront = readCurrency (usd $ RDSReserved.prices y1), rate = readCurrency (usd $ RDSReserved.prices y1hr) },
       GeneralPricing { fam = "rds", region = RDSReserved.region region, name = RDSReserved.size size, rate'type = rate'type'prefix ++ "y3", upfront = readCurrency (usd $ RDSReserved.prices y3), rate = readCurrency (usd $ RDSReserved.prices y3hr) }]
   ) $ RDSReserved.tiers instanceType
  ) $ RDSReserved.instanceType region
 ) $ RDSReserved.regions $ RDSReserved.config rds

ecToGP ec =
 concat $ concat $ map (\region ->
  map (\types ->
   map (\tier ->
    GeneralPricing { fam = "ec", region = EC.region region, name = EC.nameT tier, rate'type = "onDemand", upfront = 0.0, rate = readCurrency (usd $ EC.prices tier) }
   ) $ EC.tiers types
  ) $ EC.types region
 ) $ EC.regions $ EC.config ec

ecToGP'ri'or'di ec rate'type'prefix =
 concat $ concat $ concat $ map (\region ->
  map (\instanceType ->
   map (\size ->
    let
     v = ECReserved.valueColumns size
     y1 = v !! 0
     y1hr = v !! 1
     y3 = v !! 2 
     y3hr = v !! 3
    in
     case (any (\x -> (usd $ ECReserved.prices x) =="N/A") v) of
      True -> []
      otherwise ->
       [GeneralPricing { fam = "ec", region = ECReserved.region region, name = ECReserved.size size, rate'type = rate'type'prefix ++ "y1", upfront = readCurrency (usd $ ECReserved.prices y1), rate = readCurrency (usd $ ECReserved.prices y1hr) },
       GeneralPricing { fam = "ec", region = ECReserved.region region, name = ECReserved.size size, rate'type = rate'type'prefix ++ "y3", upfront = readCurrency (usd $ ECReserved.prices y3), rate = readCurrency (usd $ ECReserved.prices y3hr) }]
   ) $ ECReserved.tiers instanceType
  ) $ ECReserved.instanceType region
 ) $ ECReserved.regions $ ECReserved.config ec

s3ToGP s3 =
 concat $ concat $ map (\region ->
  map (\tier ->
   map (\storageType ->
    GeneralPricing { fam = "s3", region = S3.region region, name = S3.name tier, rate'type = S3.typeV storageType, upfront = 0.0, rate = readCurrency (usd $ S3.prices storageType) :: Double }
   ) $ S3.storageTypes tier
  ) $ S3.tiers region
 ) $ S3.regions $ S3.config s3


readCurrency s = read (filter (\c -> isDigit c || c == '.') s) :: Double
