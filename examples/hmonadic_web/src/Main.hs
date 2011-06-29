module Main where

import Request
import RequestReader
import Response
import Control.Monad.Reader
import Control.Monad.Instances

goodRequest :: Request
goodRequest = [("a","a"),("b","b")]

badRequest :: Request
badRequest = [("b","b")]

handler :: Reader Request Response
handler = do
  a <- myRead "a"
  return (fmap Value a)

browser :: Request -> String
browser r = case (runReader handler r) of
              Right (Value v) -> "Page rendered STRING: "++v
              Right (Stream vs) -> "Page rendered STREAM: "++(show vs)
              Left v -> "BZZT! Invalid request: "++v

main::IO()
main = do
  putStrLn $ show $ browser goodRequest
  putStrLn $ show $ browser badRequest
