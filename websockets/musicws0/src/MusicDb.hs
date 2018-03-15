{-# LANGUAGE OverloadedStrings #-}

module MusicDb (params) where

import Data.ByteString as B

params :: B.ByteString
params = "host='localhost' port=5432 dbname=music_db user=music_user password='toto'" 

