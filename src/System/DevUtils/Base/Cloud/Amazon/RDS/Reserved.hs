{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.RDS.Reserved (
 RDSRoot (..),
 RDSConfig (..),
 RDSRegion (..),
 RDSInstanceType (..),
 RDSTier (..),
 RDSValueColumns (..)
) where

import System.DevUtils.Base.Cloud.Amazon.Misc
import System.DevUtils.Base.Currency

import Data.Aeson
import Control.Applicative
import Control.Monad

data RDSRoot = RDSRoot {
 vers :: Version,
 config :: RDSConfig
} deriving (Show, Read, Eq)

instance FromJSON RDSRoot where
 parseJSON (Object v) = RDSRoot <$>
  v .: "vers" <*>
  v .: "config"
 parseJSON _ = mzero


data RDSConfig = RDSConfig {
 regions :: [RDSRegion]
} deriving (Show, Read, Eq)

instance FromJSON RDSConfig where
 parseJSON (Object v) = RDSConfig <$>
  v .: "regions"
 parseJSON _ = mzero


data RDSRegion = RDSRegion {
 region :: String,
 instanceType :: [RDSInstanceType]
} deriving (Show, Read, Eq)

instance FromJSON RDSRegion where
 parseJSON (Object v) = RDSRegion <$>
  v .: "region" <*>
  v .: "instanceTypes"
 parseJSON _ = mzero


data RDSInstanceType = RDSInstanceType {
 typeI :: String,
 tiers :: [RDSTier]
} deriving (Show, Read, Eq)

instance FromJSON RDSInstanceType where
 parseJSON (Object v) = RDSInstanceType <$>
  v .: "type" <*>
  v .: "tiers"
 parseJSON _ = mzero


data RDSTier = RDSTier {
 size :: String,
 valueColumns :: [RDSValueColumns]
} deriving (Show, Read, Eq)

instance FromJSON RDSTier where
 parseJSON (Object v) = RDSTier <$>
  v .: "size" <*>
  v .: "valueColumns"
 parseJSON _ = mzero


data RDSValueColumns = RDSValueColumns {
 name :: String,
 rate :: Maybe String,
 prices :: CurrencyObject
} deriving (Show, Read, Eq)

instance FromJSON RDSValueColumns where
 parseJSON (Object v) = RDSValueColumns <$>
  v .: "name" <*>
  v .:? "rate" <*>
  v .: "prices"
 parseJSON _ = mzero
