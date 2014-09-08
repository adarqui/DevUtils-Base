{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.ElastiCache (
 EC (..),
 ECRoot (..),
 ECConfig (..),
 ECRegion (..),
 ECType (..),
 ECTier (..)
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
 regions :: [ECRegion]
} deriving (Show, Read, Eq)

instance FromJSON ECConfig where
 parseJSON (Object v) = ECConfig <$>
  v .: "regions"
 parseJSON _ = mzero


data ECRegion = ECRegion {
 region :: String,
 types :: [ECType]
} deriving (Show, Read, Eq)

instance FromJSON ECRegion where
 parseJSON (Object v) = ECRegion <$>
  v .: "region" <*>
  v .: "types"
 parseJSON _ = mzero


data ECType = ECType {
 name :: String,
 tiers :: [ECTier]
} deriving (Show, Read, Eq)

instance FromJSON ECType where
 parseJSON (Object v) = ECType <$>
  v .: "name" <*>
  v .: "tiers"
 parseJSON _ = mzero


data ECTier = ECTier {
 nameT :: String,
 prices :: CurrencyObject
} deriving (Show, Read, Eq)

instance FromJSON ECTier where
 parseJSON (Object v) = ECTier <$>
  v .: "name" <*>
  v .: "prices"
 parseJSON _ = mzero
