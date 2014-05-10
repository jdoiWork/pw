module Handler.About where

import Import

getAboutR :: Handler Html
getAboutR = do
    defaultLayout $ do
        setTitle "about | jdoi.pw"
        $(widgetFile "about")
