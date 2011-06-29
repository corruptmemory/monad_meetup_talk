module Response (
  Response,
  ResponseValue(..)
) where

data ResponseValue = Value String
                   | Stream [String]
                     deriving (Show)

type Response = Either String ResponseValue
