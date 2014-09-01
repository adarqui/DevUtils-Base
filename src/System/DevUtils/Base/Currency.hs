{-# LANGUAGE OverloadedStrings #-}
module System.DevUtils.Base.Currency (
 Currency (..)
) where

import Data.Aeson
import Control.Applicative

data Currency = USD
 deriving (Show, Read, Eq)

instance FromJSON Currency where
 parseJSON (String "USD") = pure USD
