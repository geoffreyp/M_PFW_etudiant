{-# LANGUAGE OverloadedStrings #-}
-- import           Control.Concurrent (MVar, newMVar, modifyMVar_, readMVar)
-- import           Control.Exception (finally)
import           Control.Monad (forever, forM_)
import qualified Data.ByteString as B
import           Data.ByteString.Lazy (toStrict)
-- import           Data.List(find)
-- import           Data.Maybe(isJust)
import qualified Network.WebSockets as WS

port = 9000

main :: IO ()
main = do
  putStrLn $ "running server on port " ++ show port ++ "..."
  WS.runServer "0.0.0.0" port application

application :: WS.PendingConnection -> IO ()
application pending = do
  conn <- WS.acceptRequest pending
  WS.forkPingThread conn 30
  forever $ do
    msg <- WS.receiveDataMessage conn 
    let txt = decodeMsg msg
    putStrLn $ "received: " ++ show txt
    WS.sendTextData conn txt

decodeMsg :: WS.DataMessage -> B.ByteString
decodeMsg (WS.Text b) = toStrict b
decodeMsg _ = ""

