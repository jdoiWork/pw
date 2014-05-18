module Handler.Tisiki where

import Import
import Language.Haskell.TH ( Exp(..) )

getTisikiR :: Handler Html
getTisikiR = 
    defaultLayout $ do
        setTitle "tisiki | jdoi.pw"
        $(widgetFile "tisiki")
        $(fayFile' (ConE 'StaticR) "Tisiki")
