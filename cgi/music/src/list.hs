{-# LANGUAGE OverloadedStrings #-}

import qualified Database.PostgreSQL.Simple as P
import qualified Network.CGI as C
import           Text.XHtml
import qualified MusicDb (params)

type DbTitle = (Int, String)

main :: IO ()
main = do
  conn <- P.connectPostgreSQL MusicDb.params
  titles <- P.query_ conn sqlTitles :: IO [DbTitle]
  C.runCGI $ C.handleErrors $ cgiMain titles

cgiMain :: [DbTitle] -> C.CGI C.CGIResult
cgiMain = C.output . renderHtml . page

page :: [DbTitle] -> Html
page titles = body $ 
  h1 << ("music" :: String)
    +++ ulist << (map (\ (i, t) -> li $ toHtml $ (show i) ++ " - " ++ t) titles)
    +++ p << (anchor ! [href "index.html"] << ("back to index.html" :: String))

sqlTitles :: P.Query
sqlTitles = "select titles.id, titles.name from titles"

