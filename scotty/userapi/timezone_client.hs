{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Data.Aeson (FromJSON, eitherDecode)
import Data.Text (Text)
import GHC.Generics (Generic)
import Network.Connection (TLSSettings (..))
import Network.HTTP.Conduit

-- TODO write a client for userapi

data MyTimezone = MyTimezone
  { dstOffset :: Int
  , rawOffset :: Int
  , status :: Text
  , timeZoneId :: Text
  , timeZoneName :: Text
  } deriving (Show, Generic)

instance FromJSON MyTimezone

main :: IO ()
main = do
  processUrl "https://maps.googleapis.com/maps/api/timezone/json?location=50,2&timestamp=0"
  processUrl "https://maps.googleapis.com/maps/api/timezone/json?location=38,140&timestamp=0"

processUrl :: String -> IO ()
processUrl url = do
  manager <- newManager $ mkManagerSettings (TLSSettingsSimple True False False) Nothing
  request <- parseRequest url
  res <- httpLbs request manager
  let dec = eitherDecode (responseBody res) :: Either String MyTimezone
  case dec of
    Left err -> putStrLn err
    Right users -> print users

