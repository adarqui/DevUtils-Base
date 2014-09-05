{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.EC2 (
 EC2 (..),
 EC2Root (..),
 EC2Config (..),
 EC2Region (..),
 EC2InstanceType (..),
 EC2Size (..),
 EC2ValueColumns (..)
) where

import System.DevUtils.Base.Cloud.Amazon.Misc
import System.DevUtils.Base.Currency

import Data.Aeson
import Control.Applicative
import Control.Monad

data EC2 = EC2 {
}


data EC2Root = EC2Root {
 vers :: Version,
 config :: EC2Config
} deriving (Show, Read, Eq)

instance FromJSON EC2Root where
 parseJSON (Object v) = EC2Root <$>
  v .: "vers" <*>
  v .: "config"
 parseJSON _ = mzero


data EC2Config = EC2Config {
 currencies :: [Currency],
 rate :: Rate,
 valueColumnsC :: [String],
 regions :: [EC2Region]
} deriving (Show, Read, Eq)

instance FromJSON EC2Config where
 parseJSON (Object v) = EC2Config <$>
  v .: "currencies" <*>
  v .: "rate" <*>
  v .: "valueColumns" <*>
  v .: "regions"
 parseJSON _ = mzero


data EC2Region = EC2Region {
 region :: String,
 instanceType :: [EC2InstanceType]
} deriving (Show, Read, Eq)

instance FromJSON EC2Region where
 parseJSON (Object v) = EC2Region <$>
  v .: "region" <*>
  v .: "instanceTypes"
 parseJSON _ = mzero


data EC2InstanceType = EC2InstanceType {
 typeI :: String,
 sizes :: [EC2Size]
} deriving (Show, Read, Eq)

instance FromJSON EC2InstanceType where
 parseJSON (Object v) = EC2InstanceType <$>
  v .: "type" <*>
  v .: "sizes"
 parseJSON _ = mzero


data EC2Size = EC2Size {
 size :: String,
 vCPU :: String,
 ecu :: String,
 memoryGiB :: String,
 storageGB :: String,
 valueColumns :: [EC2ValueColumns]
} deriving (Show, Read, Eq)

instance FromJSON EC2Size where
 parseJSON (Object v) = EC2Size <$>
  v .: "size" <*>
  v .: "vCPU" <*>
  v .: "ECU" <*>
  v .: "memoryGiB" <*>
  v .: "storageGB" <*>
  v .: "valueColumns"
 parseJSON _ = mzero


data EC2ValueColumns = EC2ValueColumns {
 name :: String,
 prices :: CurrencyObject
} deriving (Show, Read, Eq)

instance FromJSON EC2ValueColumns where
 parseJSON (Object v) = EC2ValueColumns <$>
  v .: "name" <*>
  v .: "prices"
 parseJSON _ = mzero
