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

setHoge :: String -> Fay ()
setHoge = ffi "$('#hoge').val(%1)"

doMyAddr :: String -> String -> Fay ()
doMyAddr = ffi "console.log(%1 + ':' + %2)"
doMyAddr1 :: MyAddr -> Fay ()
doMyAddr1 = ffi "console.log(%1)"

consoleLog :: a -> Fay ()
consoleLog = ffi "console.log(%1)"

data NgScope

createHomeCtrl :: (NgScope -> Fay ()) -> Fay ()
createHomeCtrl = ffi "app.controller('HomeCtrl', function($scope){ %1($scope);})"

data HomeName = HomeName 
              { name :: String
              }
jdoiHomeName = HomeName "jdoi"

setJdoi :: NgScope -> HomeName -> Fay ()
setJdoi = ffi "%1.home = %2" 

setHogeNg :: NgScope -> String -> Fay ()
setHogeNg = ffi "%1.hoge = %2 " 

setJdoiWithHoge :: NgScope -> Fay()
setJdoiWithHoge scope = do
    setJdoi scope jdoiHomeName
    call GetHoge $ \t -> do 
      setHogeNg scope $ toString t
      applyScope scope

applyScope :: NgScope -> Fay ()
applyScope = ffi "%1.$apply()"

main :: Fay ()
main = do
    input <- getElementById "fibindex"
    result <- getElementById "fibresult"
    onKeyUp input $ do
        indexS <- getAttribute "value" input
        index <- parseInt indexS
        call (GetFib index) $ setInnerHTML result . show
    call GetHoge $ setHoge . toString
    call GetMyAddr $ \(MyAddr name mail) -> doMyAddr name mail
    call GetMyAddr $ doMyAddr1
    createHomeCtrl $ setJdoiWithHoge -- flip setJdoi jdoiHomeName

