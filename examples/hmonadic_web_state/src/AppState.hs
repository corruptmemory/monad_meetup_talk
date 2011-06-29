-----------------------------------------------------------------------------
--
-- Module      :  AppState
-- Copyright   :
-- License     :  AllRightsReserved
--
-- Maintainer  :
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

module AppState (
  AppState(..),
  User,
  UserDB,
  newAppState,
  mkUser,
  addUser,
  removeUser,
  emptyUserDb,
  findUser,
  updateUser
) where

import Data.List

data User = User {
  username :: String,
  password :: String
}

type UserDB = [User]

data AppState = AppState {
  user :: Maybe User
}

mkUser :: String -> String -> User
mkUser = User

addUser :: User -> UserDB -> UserDB
addUser u udb = u:udb

removeUser :: String -> UserDB -> UserDB
removeUser n udb = filter (\x -> n /= (username x)) udb

findUser :: String -> String -> UserDB -> (Maybe User)
findUser u p udb = find (\x -> (username x) == u && (password x) == p) udb

emptyUserDb :: UserDB
emptyUserDb = []

newAppState :: AppState
newAppState = AppState { user = Nothing }

updateUser :: (Maybe User) -> AppState -> AppState
updateUser u as = as { user = u }
