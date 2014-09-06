{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.ElastiCache.Reserved (
 ECRoot (..),
 ECConfig (..),
 ECRegion (..),
 ECInstanceType (..),
 ECTier (..),
 ECValueColumns (..)
) where

import System.DevUtils.Base.Cloud.Amazon.Misc
import System.DevUtils.Base.Currency

import Data.Aeson
import Control.Applicative
import Control.Monad

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
 regions :: [ECRegion]
} deriving (Show, Read, Eq)

instance FromJSON ECConfig where
 parseJSON (Object v) = ECConfig <$>
  v .: "regions"
 parseJSON _ = mzero


data ECRegion = ECRegion {
 region :: String,
 instanceType :: [ECInstanceType]
} deriving (Show, Read, Eq)

instance FromJSON ECRegion where
 parseJSON (Object v) = ECRegion <$>
  v .: "region" <*>
  v .: "instanceTypes"
 parseJSON _ = mzero


data ECInstanceType = ECInstanceType {
 typeI :: String,
 tiers :: [ECTier]
} deriving (Show, Read, Eq)

instance FromJSON ECInstanceType where
 parseJSON (Object v) = ECInstanceType <$>
  v .: "type" <*>
  v .: "tiers"
 parseJSON _ = mzero


data ECTier = ECTier {
 size :: String,
 valueColumns :: [ECValueColumns]
} deriving (Show, Read, Eq)

instance FromJSON ECTier where
 parseJSON (Object v) = ECTier <$>
  v .: "size" <*>
  v .: "valueColumns"
 parseJSON _ = mzero


data ECValueColumns = ECValueColumns {
 name :: String,
 rate :: Maybe String,
 prices :: CurrencyObject
} deriving (Show, Read, Eq)

instance FromJSON ECValueColumns where
 parseJSON (Object v) = ECValueColumns <$>
  v .: "name" <*>
  v .:? "rate" <*>
  v .: "prices"
 parseJSON _ = mzero
