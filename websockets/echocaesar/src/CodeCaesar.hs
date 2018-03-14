{-# LANGUAGE OverloadedStrings #-}

module CodeCaesar (codeCaesar) where

import qualified Data.ByteString.Lazy as B
import           Data.Word (Word8)

minLower :: Word8
minLower = 97

maxLower :: Word8
maxLower = minLower + 26

isLower :: Word8 -> Bool
isLower c = minLower <= c && c <= maxLower

shiftWord8 :: Word8 -> Word8 -> Word8
shiftWord8 n c | isLower c = minLower + ((n - minLower + c) `mod` 26)
               | otherwise = c

codeCaesar :: Word8 -> B.ByteString -> B.ByteString
codeCaesar n = B.map (shiftWord8 n)

