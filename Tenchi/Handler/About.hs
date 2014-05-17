{-# LANGUAGE RecordWildCards #-}

module Handler.About where

import Import

getAboutR :: Handler Html
getAboutR = do
    defaultLayout $ do
        setTitle "about | jdoi.pw"
        $(widgetFile "about")

data Person = Person
    { name :: Text
    , age  :: Int
    }

instance ToJSON Person where
    toJSON Person {..} = object
        [ "name" .= name
        , "age"  .= age
        ]

getPersonR :: Handler Value
getPersonR = returnJson $ [Person "Michael" 28]

