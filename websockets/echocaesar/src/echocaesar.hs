{-# LANGUAGE OverloadedStrings #-}

import           CodeCaesar (codeCaesar)
import           Control.Monad (forever)
import           Data.ByteString.Char8 (readInt)
import qualified Data.ByteString.Lazy as B
import           Data.Maybe (fromMaybe)
import qualified Network.WebSockets as WS
import           Data.Word (Word8)

port = 9000

main :: IO ()
main = do
  putStrLn $ "running server on port " ++ (show port) ++ "..."
  WS.runServer "0.0.0.0" port application

application :: WS.PendingConnection -> IO ()
application pc = WS.acceptRequest pc >>= forever . handleConnection 
-- TODO rewrite using the do notation

handleConnection :: WS.Connection -> IO ()
handleConnection c = WS.receiveDataMessage c 
  >>= WS.sendTextData c . codeCaesar 13 . decodeMsg
-- TODO rewrite using the do notation

-- TODO receive encryption key

decodeMsg :: WS.DataMessage -> B.ByteString
decodeMsg (WS.Text b) = b
decodeMsg _ = ""

bytestringToWord8 :: B.ByteString -> Word8
bytestringToWord8 b = fromIntegral $ maybe 0 fst (readInt $ B.toStrict b)

