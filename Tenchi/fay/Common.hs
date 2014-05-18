{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE EmptyDataDecls    #-}
module Common where

import Prelude
import Fay.FFI
import Language.Fay.Yesod
import SharedTypes

consoleLog :: a -> Fay ()
consoleLog = ffi "console.log(%1)"

data NgScope

createCtrl :: String -> (NgScope -> Fay ()) -> Fay ()
createCtrl = ffi "app.controller(%1, function($scope){ %2($scope);})"

applyScope :: NgScope -> Fay ()
applyScope = ffi "%1.$apply()"

