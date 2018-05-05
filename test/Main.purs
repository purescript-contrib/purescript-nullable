module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Console (logShow)
import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable, toMaybe)

main :: Effect Unit
main = do
  logShow $ toNullable (Nothing :: Maybe Number)
  logShow $ toNullable (Just 42)

  logShow $ toMaybe $ toNullable (Nothing :: Maybe Number)
  logShow $ toMaybe $ toNullable (Just 42)

  logShow $ toNullable Nothing == toNullable (Just 42)
  logShow $ toNullable Nothing `compare` toNullable (Just 42)
