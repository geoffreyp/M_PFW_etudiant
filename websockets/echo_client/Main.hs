import qualified Data.ByteString as B
import           Data.ByteString.Lazy (toStrict)
import qualified Data.ByteString.Char8 as BC
import qualified Network.WebSockets as WS

main :: IO ()
main = WS.runClient "echo.websocket.org" 80 "" clientApp

clientApp :: WS.ClientApp ()
clientApp conn = do
  WS.forkPingThread conn 30
  handleConnection conn

handleConnection :: WS.Connection -> IO ()
handleConnection conn = do
    putStrLn "to server: "
    msgToSrv <- getLine
    WS.sendTextData conn (BC.pack msgToSrv)
    msgFromSrv <- WS.receiveDataMessage conn
    putStrLn "from server: "
    BC.putStrLn $ decodeMsg msgFromSrv
    putStrLn ""
-- TODO loop for user inputs

decodeMsg :: WS.DataMessage -> B.ByteString
decodeMsg (WS.Text b) = toStrict b
decodeMsg _ = BC.pack ""

