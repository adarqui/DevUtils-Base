module System.DevUtils.Base.Finance.Misc (
 GeneralPricing (..)
) where

-- everything per hr
data GeneralPricing = GeneralPricing {
 fam :: String,
 region :: String,
 name :: String,
 rate'type :: String,
 upfront :: Double,
 rate :: Double
} deriving (Show, Read, Eq, Ord)
