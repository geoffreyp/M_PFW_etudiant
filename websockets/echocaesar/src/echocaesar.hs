import           CodeCaesar
import           Control.Monad (forever)
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import           Data.ByteString.Lazy (toStrict)
import qualified Network.WebSockets as WS

port = 9000
caesarShift = 13

main :: IO ()
main = do
  putStrLn $ "running server on port " ++ (show port) ++ "..."
  WS.runServer "0.0.0.0" port application

application :: ServerApp
application pc = WS.acceptRequest pc >>= forever . handleConnection 
-- TODO rewrite using the do notation

handleConnection :: WS.Connection -> IO ()
handleConnection c = WS.receiveDataMessage c 
  >>= WS.sendTextData c . codeCaesar caesarShift . decodeMsg
-- TODO rewrite using the do notation

decodeMsg :: WS.DataMessage -> B.ByteString
decodeMsg (WS.Text b) = toStrict b
decodeMsg _ = BC.pack ""

