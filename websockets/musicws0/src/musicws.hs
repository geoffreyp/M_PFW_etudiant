{-# LANGUAGE OverloadedStrings #-}

import           Control.Monad (forever)
import qualified Data.ByteString as B
import           Data.ByteString.Lazy (toStrict)
import qualified Database.PostgreSQL.Simple as P
import qualified MusicDb (params)
import qualified Network.WebSockets as WS

main :: IO ()
main = putStrLn "running server..." >> WS.runServer "0.0.0.0" 9000 application

application :: WS.ServerApp
application pc = WS.acceptRequest pc >>= forever . handleConnection 

handleConnection :: WS.Connection -> IO ()
handleConnection connection = do
  msg <- WS.receiveDataMessage connection
  let titles = [("artist1", "title1"), ("artist2", "title2")]
  WS.sendTextData connection $ format titles
-- TODO select titles in database

type DbTitle = (B.ByteString, B.ByteString)

format :: [DbTitle] -> B.ByteString
format = B.intercalate "\n" . map (\ (a, t) -> B.concat [a, " - ", t]) 

decodeMsg :: WS.DataMessage -> B.ByteString
decodeMsg (WS.Text b) = toStrict b
decodeMsg _ = ""

