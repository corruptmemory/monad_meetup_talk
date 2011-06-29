module RequestReader where

import Control.Monad.Reader
import Request

type ReadResult a = Either String a

myRead :: String -> Reader Request (ReadResult String)
myRead k =
  asks (doRead k) >>= return
  where
    doRead k r = case (lookup k r) of
                   Nothing -> Left $ "Could not find value for:"++k
                   Just e -> Right e
