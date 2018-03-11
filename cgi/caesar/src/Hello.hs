import Data.Maybe
import Network.CGI

main :: IO ()
main = runCGI $ handleErrors cgiMain 

cgiMain :: CGI CGIResult
cgiMain = getInput "name" >>= output . myRender 

myRender :: Maybe String -> String
myRender mName = "<!DOCTYPE html>\n<html><body>\n"
  ++ "<h1>hello " ++ name ++ "</h1> \n"
  ++ "<p><a href='index.html'>back to index.html</a></p> \n"
  ++ "</body></html> \n"
    where name = maybe "unknown user" id mName

