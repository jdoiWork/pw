{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE EmptyDataDecls    #-}
module Tisiki where

import Prelude
import Fay.FFI
import Language.Fay.Yesod
import SharedTypes
import Common

createTisikiCtrl :: (NgScope -> Fay ()) -> Fay ()
createTisikiCtrl f = createCtrl "TisikiCtrl" f


setTisiki :: NgScope -> Fay ()
setTisiki scope = do
    call GetTisikiItems $ \tis -> do 
       setTisikiItems scope tis
       -- setTempTisiki scope  
       applyScope scope

setTisikiItems :: NgScope -> [TisikiItem] -> Fay ()
setTisikiItems = ffi "%1.items = %2"
    
setTempTisiki :: NgScope -> Fay ()
setTempTisiki = ffi "%1.tisiki = '知識'"

main :: Fay ()
main = do
    createTisikiCtrl setTisiki

