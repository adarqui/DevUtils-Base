{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.S3 (
 S3Config (..),
 S3Region (..),
 S3Tier (..),
 S3StorageType (..),
 S3Root (..)
) where

import System.DevUtils.Base.Cloud.Amazon.Misc
import System.DevUtils.Base.Currency

import Data.Aeson
import Control.Applicative
import Control.Monad

data S3Root = S3Root {
 vers :: Version,
 config :: S3Config
} deriving (Show, Read, Eq)

instance FromJSON S3Root where
 parseJSON (Object v) = S3Root <$>
  v .: "vers" <*>
  v .: "config"
 parseJSON _ = mzero


data S3Config = S3Config {
 currencies :: [Currency],
 rate :: Rate,
 regions :: [S3Region],
 valueColumns :: [String]
} deriving (Show, Read, Eq)

instance FromJSON S3Config where
 parseJSON (Object v) = S3Config <$>
  v .: "currencies" <*>
  v .: "rate" <*>
  v .: "regions" <*>
  v .: "valueColumns"
 parseJSON _ = mzero

data S3Region = S3Region {
 region :: String,
 tiers :: [S3Tier]
} deriving (Show, Read, Eq)

instance FromJSON S3Region where
 parseJSON (Object v) = S3Region <$>
  v .: "region" <*>
  v .: "tiers"
 parseJSON _ = mzero


data S3Tier = S3Tier {
 name :: String,
 storageTypes :: [S3StorageType]
} deriving (Show, Read, Eq)

instance FromJSON S3Tier where
 parseJSON (Object v) = S3Tier <$>
  v .: "name" <*>
  v .: "storageTypes"
 parseJSON _ = mzero


data S3StorageType = S3StorageType {
 typeV :: String,
 prices :: CurrencyObject
} deriving (Show, Read, Eq)

instance FromJSON S3StorageType where
 parseJSON (Object v) = S3StorageType <$>
  v .: "type" <*>
  v .: "prices"
 parseJSON _ = mzero
