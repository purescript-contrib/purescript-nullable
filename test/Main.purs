module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable, toMaybe)

main :: Eff (console :: CONSOLE) Unit
main = do
  logShow $ toNullable (Nothing :: Maybe Number)
  logShow $ toNullable (Just 42)

  logShow $ toMaybe $ toNullable (Nothing :: Maybe Number)
  logShow $ toMaybe $ toNullable (Just 42)

  logShow $ toNullable Nothing == toNullable (Just 42)
  logShow $ toNullable Nothing `compare` toNullable (Just 42)
