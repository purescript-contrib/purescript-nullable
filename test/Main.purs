module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable, toMaybe, null, Nullable)
import Effect (Effect)
import Test.Assert (assertEqual)

main :: Effect Unit
main = do
  assertEqual
    { actual: toMaybe $ toNullable (Nothing :: Maybe Number)
    , expected: Nothing
    }
  assertEqual
    { actual: toMaybe $ toNullable (Just 42)
    , expected: Just 42
    }
  assertEqual
    { actual: toNullable Nothing == toNullable (Just 42)
    , expected: false
    }
  assertEqual
    { actual: toNullable Nothing `compare` toNullable (Just 42)
    , expected: LT
    }
  assertEqual
    { actual: toMaybe (toNullable (Just 1)) == Just 1
    , expected: true
    }
  -- Make sure we don't violate parametricity (See https://github.com/purescript-contrib/purescript-nullable/issues/7)
  let (nullInt::Nullable Int) = null
  assertEqual
    { actual: toMaybe (toNullable (Just nullInt)) == Just nullInt
    , expected: true
    }
