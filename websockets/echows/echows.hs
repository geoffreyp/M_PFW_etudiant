{-# LANGUAGE OverloadedStrings #-}

import           Control.Monad (forever)
import qualified Data.ByteString as B
import           Data.ByteString.Lazy (toStrict)
import qualified Data.ByteString.Char8 as BC
import qualified Network.WebSockets as WS

main :: IO ()
main = do
  putStrLn "running server..." 
  WS.runServer "0.0.0.0" 9000 application

application :: WS.PendingConnection -> IO ()
application pc = do
  conn <- WS.acceptRequest pc
  WS.forkPingThread conn 30
  handleConnection conn
  -- TODO loop for client messages

handleConnection :: WS.Connection -> IO ()
handleConnection conn = do
  msg <- WS.receiveDataMessage conn
  let txt = decodeMsg msg
  BC.putStrLn txt
  -- TODO send message back to client

decodeMsg :: WS.DataMessage -> B.ByteString
decodeMsg (WS.Text b) = toStrict b
decodeMsg _ = ""

