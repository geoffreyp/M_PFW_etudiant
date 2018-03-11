import Data.Char
import Data.List
import Data.Maybe
import Network.CGI
import Text.XHtml

main :: IO ()
main = runCGI $ handleErrors cgiMain 

cgiMain :: CGI CGIResult
cgiMain = do
  mMessage <- getInput "message" 
  mShift <- getInput "shift" 
  output $ renderHtml $ page mMessage mShift

page :: Maybe String -> Maybe String -> Html 
page mMessage mShift = 
  -- TODO
  body << (p << codeCaesar 1 "hal")

shiftChar :: Int -> Char -> Char
shiftChar n c | isLower c = chr $ ord 'a' + ((n + ord c - ord 'a') `mod` 26)
            | otherwise = c

codeCaesar :: Int -> String -> String
codeCaesar n = map (shiftChar n)

