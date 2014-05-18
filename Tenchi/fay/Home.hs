{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE EmptyDataDecls    #-}
module Home where

import Prelude
import Fay.FFI
import Language.Fay.Yesod
import SharedTypes

data Element

getElementById :: String -> Fay Element
getElementById = ffi "document.getElementById(%1)"

getAttribute :: String -> Element -> Fay String
getAttribute = ffi "%2[%1]"

setInnerHTML :: Element -> String -> Fay ()
setInnerHTML = ffi "%1.innerHTML=%2"

onKeyUp :: Element -> Fay () -> Fay ()
onKeyUp = ffi "%1.onkeyup=%2"

alert :: String -> Fay ()
alert = ffi "window.alert(%1)"

parseInt :: String -> Fay Int
parseInt = ffi "window.parseInt(%1, 10)"


consoleLog :: a -> Fay ()
consoleLog = ffi "console.log(%1)"

applyScope :: NgScope -> Fay ()
applyScope = ffi "%1.$apply()"

main :: Fay ()
main = do
    void

