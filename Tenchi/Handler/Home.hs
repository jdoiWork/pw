{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Home where

import Import
import Language.Haskell.TH ( Exp(..) )

-- This is a handler function for the GET request method on the HomeR
-- resource pattern. All of your resource patterns are defined in
-- config/routes
-- これはHomeRリソースパターンのGETリクエストメソッド用のhandler関数です。
-- すべてのリソースパターンは、config/routesで定義されています。
--
-- The majority of the code you will write in Yesod lives in these handler
-- functions. You can spread them across multiple files if you are so
-- inclined, or create a single monolithic file.
-- あなたがYesodで書くコードの大部分は、これらのhandler関数内で生きています。
-- もし望むなら、これらを複数のファイルに分散したり、単一のモノリシックファイルにすることもできます。
getHomeR :: Handler Html
getHomeR = do
    (formWidget, formEnctype) <- generateFormPost sampleForm
    let submission = Nothing :: Maybe (FileInfo, Text)
        handlerName = "getHomeR" :: Text
    maid <- maybeAuthId
    muser <- maybeAuth
    defaultLayout $ do
        aDomId <- newIdent
        setTitle "jdoi.pw"
        $(widgetFile "homepage")
        -- $(fayFile' (ConE 'StaticR) "Home")

--postHomeR :: Handler Html
--postHomeR = do
    --((result, formWidget), formEnctype) <- runFormPost sampleForm
    --let handlerName = "postHomeR" :: Text
        --submission = case result of
            --FormSuccess res -> Just res
            --_ -> Nothing
        --jjjj = "jdoi" :: Text
    --defaultLayout $ do
        --aDomId <- newIdent
        --setTitle "Welcome To Yesod!"
        -- $(widgetFile "homepage")

sampleForm :: Form (FileInfo, Text)
sampleForm = renderDivs $ (,)
    <$> fileAFormReq "Choose a file"
    <*> areq textField "What's on the file?" Nothing
