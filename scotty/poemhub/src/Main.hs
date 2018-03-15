{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.Trans (liftIO)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Web.Scotty (get, middleware, param, post, rescue, scotty, html)

import qualified Model
import qualified View

-- TODO implement routes

main = scotty 3000 $ do

  middleware logStdoutDev

  get "/" $ do
    let fakePoems = [ Model.Poem 1 "author1" "title1" 2001 "body1"
                    , Model.Poem 2 "author2" "title2" 2002 "body2" ]
    html $ View.mkpage "Poem hub - Home" $ View.homeRoute fakePoems

