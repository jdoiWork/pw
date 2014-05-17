{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DeriveDataTypeable #-}
module SharedTypes where

import Prelude
import Data.Data
import Language.Fay.Yesod
#ifdef FAY
import FFI
#else
--import Language.Fay.FFI
#endif

data MyAddr = MyAddr
            { maName :: String
            , maMail :: String
            } deriving (Show, Read, Typeable, Data)

data Command = GetFib Int (Returns Int)
             | GetHoge (Returns Text)
             | GetMyAddr (Returns MyAddr)
               deriving (Read, Typeable, Data)

