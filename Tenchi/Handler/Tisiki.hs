module Handler.Tisiki where

import Import

getTisikiR :: Handler Html
getTisikiR = 
    defaultLayout $ do
        setTitle "tisiki | jdoi.pw"
        $(widgetFile "tisiki")
