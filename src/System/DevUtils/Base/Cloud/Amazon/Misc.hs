{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Cloud.Amazon.Misc (
 Region (..),
 Rate (..),
 CurrencyObject (..),
 Version
) where

import System.DevUtils.Base.Currency
import Data.Aeson
import Control.Applicative
import Control.Monad

data Region =
 UsEast | UsWest | UsWest2 | EuIreland | ApacSin | ApacTokyo | ApacSyd | SaEast1
 deriving (Show, Read, Eq)

instance FromJSON Region where
 parseJSON (String "us-east") = pure UsEast
 parseJSON (String "us-west") = pure UsWest
 parseJSON (String "us-west-2") = pure UsWest2
 parseJSON (String "eu-ireland") = pure EuIreland
 parseJSON (String "apac-sin") = pure ApacSin
 parseJSON (String "apac-tokyo") = pure ApacTokyo
 parseJSON (String "apac-syd") = pure ApacSyd
 parseJSON (String "sa-east-1") = pure SaEast1
 parseJSON _ = mzero


data Rate =
 PerGB | PerHr
 deriving (Show, Read, Eq)

instance FromJSON Rate where
 parseJSON (String "perGB") = pure PerGB
 parseJSON (String "perhr") = pure PerHr
 parseJSON _ = mzero


data CurrencyObject = CurrencyObject {
 usd :: String
} deriving (Show, Read, Eq)

instance FromJSON CurrencyObject where
 parseJSON (Object v) = CurrencyObject <$>
  v .: "USD"
 parseJSON _ = mzero


type Version = Double
