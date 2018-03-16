{-# LANGUAGE OverloadedStrings #-}

import           Control.Monad (forever)
import qualified Data.Text as T
import qualified Database.SQLite.Simple as SQL
import qualified Network.WebSockets as WS


main :: IO ()
main = putStrLn "running server..." >> WS.runServer "0.0.0.0" 9000 application

application :: WS.ServerApp
application pc = WS.acceptRequest pc >>= forever . handleConnection 

handleConnection :: WS.Connection -> IO ()
handleConnection connection = do
  msg <- WS.receiveDataMessage connection
  conn <- SQL.open "music1.db"
  let selectReq = "SELECT t.name, a.name FROM titles t, artists a WHERE t.name LIKE (?) AND a.id = t.artist"
  r <- SQL.query conn selectReq (SQL.Only (T.concat ["%",decodeMsg msg,"%"]:: T.Text)) :: IO [DbTitle]
  print r
  WS.sendTextData connection $ format r


type DbTitle = (T.Text, T.Text)

format :: [DbTitle] -> T.Text
format = T.intercalate "\n" . map (\ (a, t) -> T.concat [a, " - ", t]) 

decodeMsg :: WS.DataMessage -> T.Text
decodeMsg (WS.Text t) = WS.fromLazyByteString t
decodeMsg _ = ""

