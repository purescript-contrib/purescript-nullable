module Test.Main where

import Prelude

import Data.Maybe
import Data.Nullable

import Control.Monad.Eff.Console

main = do
  print $ toNullable (Nothing :: Maybe Number)
  print $ toNullable (Just 42)

  print $ toMaybe $ toNullable (Nothing :: Maybe Number)
  print $ toMaybe $ toNullable (Just 42)

  print $ toNullable Nothing == toNullable (Just 42)
  print $ toNullable Nothing `compare` toNullable (Just 42)
