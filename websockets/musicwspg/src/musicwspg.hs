{-# LANGUAGE OverloadedStrings #-}

import           Control.Monad (forever)
import qualified Data.Text as T
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
  let str = decodeMsg msg
  conn <- P.connectPostgreSQL MusicDb.params
  titles <- P.query conn sqlSearch (P.Only (T.concat ["%", str, "%"])) :: IO [DbTitle]
  WS.sendTextData connection $ format titles
  P.close conn

sqlSearch = "SELECT artists.name, titles.name FROM artists INNER JOIN titles ON artists.id = titles.artist WHERE LOWER(titles.name) LIKE LOWER(?)" 

type DbTitle = (T.Text, T.Text)

format :: [DbTitle] -> T.Text
format = T.intercalate "\n" . map (\ (a, t) -> T.concat [a, " - ", t]) 

decodeMsg :: WS.DataMessage -> T.Text
decodeMsg (WS.Text b) = WS.fromLazyByteString b
decodeMsg _ = ""

