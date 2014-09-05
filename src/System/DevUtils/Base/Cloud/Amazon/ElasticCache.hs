{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.ElasticCache (
 EC (..),
 ECRoot (..),
 ECConfig (..),
 ECRegion (..),
 ECInstanceType (..),
 ECSize (..),
 ECValueColumns (..)
) where

import System.DevUtils.Base.Cloud.Amazon.Misc
import System.DevUtils.Base.Currency

import Data.Aeson
import Control.Applicative
import Control.Monad

data EC = EC {
}


data ECRoot = ECRoot {
 vers :: Version,
 config :: ECConfig
} deriving (Show, Read, Eq)

instance FromJSON ECRoot where
 parseJSON (Object v) = ECRoot <$>
  v .: "vers" <*>
  v .: "config"
 parseJSON _ = mzero


data ECConfig = ECConfig {
 currencies :: [Currency],
 rate :: Rate,
 valueColumnsC :: [String],
 regions :: [ECRegion]
} deriving (Show, Read, Eq)

instance FromJSON ECConfig where
 parseJSON (Object v) = ECConfig <$>
  v .: "currencies" <*>
  v .: "rate" <*>
  v .: "valueColumns" <*>
  v .: "regions"
 parseJSON _ = mzero


data ECRegion = ECRegion {
 region :: Region,
 instanceType :: [ECInstanceType]
} deriving (Show, Read, Eq)

instance FromJSON ECRegion where
 parseJSON (Object v) = ECRegion <$>
  v .: "region" <*>
  v .: "instanceTypes"
 parseJSON _ = mzero


data ECInstanceType = ECInstanceType {
 typeI :: String,
 sizes :: [ECSize]
} deriving (Show, Read, Eq)

instance FromJSON ECInstanceType where
 parseJSON (Object v) = ECInstanceType <$>
  v .: "type" <*>
  v .: "sizes"
 parseJSON _ = mzero


data ECSize = ECSize {
 size :: String,
 vCPU :: String,
 ecu :: String,
 memoryGiB :: String,
 storageGB :: String,
 valueColumns :: [ECValueColumns]
} deriving (Show, Read, Eq)

instance FromJSON ECSize where
 parseJSON (Object v) = ECSize <$>
  v .: "size" <*>
  v .: "vCPU" <*>
  v .: "ECU" <*>
  v .: "memoryGiB" <*>
  v .: "storageGB" <*>
  v .: "valueColumns"
 parseJSON _ = mzero


data ECValueColumns = ECValueColumns {
 name :: String,
 prices :: CurrencyObject
} deriving (Show, Read, Eq)

instance FromJSON ECValueColumns where
 parseJSON (Object v) = ECValueColumns <$>
  v .: "name" <*>
  v .: "prices"
 parseJSON _ = mzero
