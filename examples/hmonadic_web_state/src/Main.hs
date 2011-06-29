module Main where

import Request
import RequestReader
import Response
import Control.Monad.Reader
import Control.Monad.Instances
import Control.Monad.State.Lazy
import AppState
import Data.Maybe

type MyState a = StateT AppState (Reader Request) a

userDB :: UserDB
userDB = addUser (mkUser "foo" "secret") emptyUserDb

authorizedRequest :: Request
authorizedRequest = [("a","a-arg"),("b","b-arg"),("username","foo"),("password","secret")]

anonymousRequest :: Request
anonymousRequest = [("a","a-arg"),("b","b-arg")]

badRequest :: Request
badRequest = [("c","c-arg")]

lMyRead :: String -> MyState (ReadResult String)
lMyRead k = lift $ myRead k

ifAuthorized :: MyState (ReadResult String) -> MyState (ReadResult String) -> MyState (ReadResult String)
ifAuthorized a b = do
  state <- get
  if (isJust (user state))
    then a
    else b

authorized :: UserDB -> MyState ()
authorized udb = do
  username <- lMyRead "username"
  password <- lMyRead "password"
  let user = case (username,password) of
                 (Right(un),Right(pw)) -> findUser un pw udb
                 otherwise -> Nothing
  state <- get
  put $ updateUser user state
  return ()

handler :: UserDB -> MyState Response
handler udb = do
  authorized udb
  a <- ifAuthorized (lMyRead "a") (lMyRead "b")
  return (fmap Value a)

browser :: UserDB -> Request -> String
browser udb r = case (runReader (evalStateT (handler udb) newAppState)  r) of
                  Right (Value v) -> "Page rendered STRING: "++v
                  Right (Stream vs) -> "Page rendered STREAM: "++(show vs)
                  Left v -> "BZZT! Invalid request: "++v

main::IO()
main = do
  putStrLn $ show $ browser userDB authorizedRequest
  putStrLn $ show $ browser userDB anonymousRequest
  putStrLn $ show $ browser userDB badRequest
