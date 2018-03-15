{-# LANGUAGE OverloadedStrings #-}

module Model where

import qualified Data.Text as T
import qualified Database.SQLite.Simple as SQL
import           Database.SQLite.Simple.FromRow (FromRow, fromRow, field)

-- TODO implement SQL queries

dbName = "poemhub.db"

data Poem = Poem 
  { id :: Int
  , author :: T.Text
  , title :: T.Text
  , year :: Int
  , body :: T.Text 
  }

instance FromRow Poem where
  fromRow = Poem <$> field <*> field <*> field <*> field <*> field

getYearText :: Poem -> T.Text
getYearText = T.pack . show . Model.year

getIdText :: Poem -> T.Text
getIdText = T.pack . show . Model.id

