{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.EBS (
 EBSConfig (..),
 EBSRegion (..),
 EBSType (..),
 EBSValue (..),
 EBSRoot (..)
) where

import System.DevUtils.Base.Cloud.Amazon.Misc
import System.DevUtils.Base.Currency

import Data.Aeson
import Control.Applicative
import Control.Monad

data EBSRoot = EBSRoot {
 vers :: Version,
 config :: EBSConfig
} deriving (Show, Read, Eq)

instance FromJSON EBSRoot where
 parseJSON (Object v) = EBSRoot <$>
  v .: "vers" <*>
  v .: "config"
 parseJSON _ = mzero


data EBSConfig = EBSConfig {
 currencies :: [Currency],
 rate :: Rate,
 regions :: [EBSRegion]
} deriving (Show, Read, Eq)

instance FromJSON EBSConfig where
 parseJSON (Object v) = EBSConfig <$>
  v .: "currencies" <*>
  v .: "rate" <*>
  v .: "regions"
 parseJSON _ = mzero


data EBSRegion = EBSRegion {
 region :: String,
 types :: [EBSType]
} deriving (Show, Read, Eq)

instance FromJSON EBSRegion where
 parseJSON (Object v) = EBSRegion <$>
  v .: "region" <*>
  v .: "types"
 parseJSON _ = mzero


data EBSType = EBSType {
 name :: String,
 values :: [EBSValue]
} deriving (Show, Read, Eq)

instance FromJSON EBSType where
 parseJSON (Object v) = EBSType <$>
  v .: "name" <*>
  v .: "values"
 parseJSON _ = mzero


data EBSValue = EBSValue {
 prices :: CurrencyObject,
 rateV :: String
} deriving (Show, Read, Eq)

instance FromJSON EBSValue where
 parseJSON (Object v) = EBSValue <$>
  v .: "prices" <*>
  v .: "rate"
 parseJSON _ = mzero
