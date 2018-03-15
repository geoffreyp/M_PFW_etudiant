{-# LANGUAGE OverloadedStrings #-}

import           CodeCaesarText
import           Control.Monad.Trans (liftIO)
import qualified Data.Text as T
import qualified Database.SQLite.Simple as SQL
import           Network.Wai.Middleware.RequestLogger (logStdoutDev)
import           Lucid
import qualified Web.Scotty as S

main = S.scotty 3000 app

app :: S.ScottyM ()
app = do

  S.middleware logStdoutDev

  S.get "/" $ mkpage "helloscotty - home" home

  -- TODO echo
  -- TODO caesar
  -- TODO music

mkpage :: Lucid.Html () -> Lucid.Html () -> S.ActionM ()
mkpage titleStr page = S.html $ renderText $ do
  doctype_
  html_ $ do
    header_ $ title_ titleStr
    body_ page

home :: Lucid.Html ()
home = do
  h1_ "Home"
  ul_ $ do
    li_ $ a_ [href_ "/echo"] "echo"
    li_ $ a_ [href_ "/caesar"] "caesar"
    li_ $ a_ [href_ "/music"] "music"
    li_ $ a_ [href_ "/music?db=music2.db"] "music?db=music2.db"

type Title = (T.Text, T.Text)

getTitles :: String -> IO ([T.Text])
getTitles filename = do
  conn <- SQL.open filename
  let query = "SELECT artists.name, titles.name FROM titles INNER JOIN artists ON titles.artist = artists.id" 
  results <- SQL.query_ conn query :: IO [Title]
  SQL.close conn
  return $ map (\ (a, t) -> T.concat [a, " - ", t]) results

