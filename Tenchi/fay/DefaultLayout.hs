{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE EmptyDataDecls    #-}
module DefaultLayout where

-- import Prelude
import Fay.FFI
-- import Language.Fay.Yesod
-- import SharedTypes

createNgApp :: Fay ()
createNgApp = ffi "app = angular.module('JdoiApp', [])"

main :: Fay ()
main = do
    createNgApp

