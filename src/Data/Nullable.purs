module Data.Nullable
  ( Nullable()
  , toMaybe
  , toNullable
  ) where

import Data.Maybe    
import Data.Function

foreign import data Nullable :: * -> *

foreign import null
  "var $$null = null" :: forall a. Nullable a
    
foreign import nullable
  "function nullable(a, r, f) {\
  \  return a === null || typeof a === 'undefined' ? r : f(a);\
  \}" :: forall a r. Fn3 (Nullable a) r (a -> r) r

foreign import notNull 
  "function notNull(x) {\
  \  return x;\
  \}" :: forall a. a -> Nullable a
        
toNullable :: forall a. Maybe a -> Nullable a
toNullable = maybe null notNull

toMaybe :: forall a. Nullable a -> Maybe a
toMaybe n = runFn3 nullable n Nothing Just

instance showNullable :: (Show a) => Show (Nullable a) where
  show n = case toMaybe n of
             Nothing -> "null"
             Just a -> show a

instance eqNullable :: (Eq a) => Eq (Nullable a) where
  (==) = (==) `on` toMaybe
  (/=) = (/=) `on` toMaybe

instance ordNullable :: (Ord a) => Ord (Nullable a) where
  compare = compare `on` toMaybe
