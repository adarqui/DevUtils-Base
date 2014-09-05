{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.RDS (
 RDS (..),
 RDSRoot (..),
 RDSConfig (..),
 RDSRegion (..),
 RDSTypes (..),
 RDSTiers (..)
) where

import System.DevUtils.Base.Cloud.Amazon.Misc
import System.DevUtils.Base.Currency

import Data.Aeson
import Control.Applicative
import Control.Monad

data RDS = RDS {
}


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
 types :: [RDSTypes]
} deriving (Show, Read, Eq)

instance FromJSON RDSRegion where
 parseJSON (Object v) = RDSRegion <$>
  v .: "region" <*>
  v .: "types"
 parseJSON _ = mzero


data RDSTypes = RDSTypes {
 tiers :: [RDSTiers]
} deriving (Show, Read, Eq)

instance FromJSON RDSTypes where
 parseJSON (Object v) = RDSTypes <$>
  v .: "tiers"
 parseJSON _ = mzero


data RDSTiers = RDSTiers {
 name :: String,
 prices :: CurrencyObject
} deriving (Show, Read, Eq)

instance FromJSON RDSTiers where
 parseJSON (Object v) = RDSTiers <$>
  v .: "name" <*>
  v .: "prices"
 parseJSON _ = mzero
