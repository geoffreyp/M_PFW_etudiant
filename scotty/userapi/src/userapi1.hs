{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

-- import Control.Monad.Trans (liftIO)
import Data.Aeson (ToJSON)
import Data.Text (Text)
-- import qualified Database.SQLite.Simple as SQL
-- import Database.SQLite.Simple.FromRow (FromRow, fromRow, field)
import GHC.Generics (Generic)
import Web.Scotty (middleware, scotty, get, json, param)
import Network.Wai.Middleware.Cors (simpleCors)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
-- import Lucid

data User = User 
  { userId :: Int
  , userFirstname :: Text 
  , userLastname :: Text 
  } deriving (Show, Generic)

instance ToJSON User

-- TODO store data in a sqlite database and use SQL queries
allUsers :: [User]
allUsers = 
  [ User 1 "Toto" "Dupont"
  , User 2 "Tata" "Duchemin"
  , User 3 "Titi" "Duchemin"
  ]

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev
  middleware simpleCors

  get "/users" $ json allUsers

  get "/users/:lastname" $ do
    lastname <- param "lastname"
    let f = (==lastname) . userLastname
    json $ filter f allUsers

  -- define a home page (html + links to previous routes)

