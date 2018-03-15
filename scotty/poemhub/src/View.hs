{-# LANGUAGE OverloadedStrings #-}

module View (mkpage, homeRoute) where

import qualified Clay as C
import qualified Data.Text as T
import qualified Data.Text.Lazy as L
import           Lucid

import qualified Model

-- TODO implement CSS styles
-- TODO implement route views

mkpage :: Lucid.Html () -> Lucid.Html () -> L.Text
mkpage titleStr page = renderText $ do
  doctype_
  html_ $ do
    header_ $ do
      title_ titleStr
    body_ page

homeRoute :: [Model.Poem] -> Lucid.Html ()
homeRoute poems = do
  h1_ "Poem hub"
  ul_ $ mapM_ (li_ . toHtml . Model.title) poems

