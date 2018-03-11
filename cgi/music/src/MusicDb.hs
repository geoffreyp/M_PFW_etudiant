{-# LANGUAGE OverloadedStrings #-}

module MusicDb (params) where

import Data.ByteString 

params :: ByteString
params = "host='localhost' port=5432 dbname=music_db user=music_user password='toto'" 

