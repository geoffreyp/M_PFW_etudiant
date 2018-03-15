{-# LANGUAGE OverloadedStrings #-}

module CodeCaesarText  where

import qualified Data.Text as T
import qualified Data.Char as C

ordA :: Int
ordA = C.ord 'a'

shiftChar :: Int -> C.Char -> C.Char
shiftChar n c | C.isLower c = C.chr $ ordA + ((n - ordA + (C.ord c)) `mod` 26)
              | otherwise = c

codeCaesar :: Int -> T.Text -> T.Text
codeCaesar n t = T.map (shiftChar n) t

