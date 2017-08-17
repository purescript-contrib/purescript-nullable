-- | This module defines types and functions for working with nullable types
-- | using the FFI.

module Data.Nullable
  ( Nullable
  , toMaybe
  , toNullable
  ) where

import Prelude

import Control.Alt (class Alt, alt)
import Control.Alternative (class Alternative)
import Control.Extend (class Extend)
import Control.Plus (class Plus)
import Data.Eq (class Eq1)
import Data.Foldable (class Foldable, foldMap, foldl, foldr)
import Data.Function (on)
import Data.Function.Uncurried (Fn3, runFn3)
import Data.Maybe (Maybe(..), maybe)
import Data.Monoid (class Monoid, mempty)
import Data.Newtype (traverse)
import Data.Ord (class Ord1)
import Data.Traversable (class Traversable)

-- | A nullable type.
-- |
-- | This type constructor may be useful when interoperating with JavaScript functions
-- | which accept or return null values.
foreign import data Nullable :: Type -> Type

-- | The null value.
foreign import null :: forall a. Nullable a

foreign import nullable :: forall a r. Fn3 (Nullable a) r (a -> r) r

-- | Wrap a non-null value.
foreign import notNull :: forall a. a -> Nullable a

-- | Takes `Nothing` to `null`, and `Just a` to `a`.
toNullable :: forall a. Maybe a -> Nullable a
toNullable = maybe null notNull

-- | Represent `null` using `Maybe a` as `Nothing`.
toMaybe :: forall a. Nullable a -> Maybe a
toMaybe n = runFn3 nullable n Nothing Just

instance showNullable :: Show a => Show (Nullable a) where
  show = maybe "null" show <<< toMaybe

instance eqNullable :: Eq a => Eq (Nullable a) where
  eq = eq `on` toMaybe

instance eq1Nullable :: Eq1 Nullable where
  eq1 = eq

instance ordNullable :: Ord a => Ord (Nullable a) where
  compare = compare `on` toMaybe

instance ord1Nullable :: Ord1 Nullable where
  compare1 = compare

instance semigroupNullable :: Semigroup a => Semigroup (Nullable a) where
  append x y = toNullable (append (toMaybe x) (toMaybe y))

instance monoidNullable :: Monoid (Nullable a) where
  mempty = null

instance functorNullable :: Functor Nullable where
  map f = toNullable <<< map f <<< toMaybe

instance foldableNullable :: Foldable Nullable where
  foldMap f = foldMap f <<< toMaybe

  foldl f acc = foldl f acc <<< toMaybe
  foldr f acc = foldr f acc <<< toMaybe

instance traversableNullable :: Traversable Nullable where
  traverse f = toNullable <<< traverse f <<< toMaybe

instance applyNullable :: Apply Nullable where
  apply f x = toNullable $ (toMaybe f) `apply` (toMaybe x)

instance applicativeNullable :: Applicative Nullable where
  pure = notNull

instance altNullable :: Alt Nullable where
  alt x y = toNullable $ (toMaybe x) `alt` (toMaybe y)

instance plusNullable :: Plus Nullable where
  empty = null

instance alternativeNullable :: Alternative Nullable

instance bindNullable :: Bind Nullable where
  bind x f = toNullable $ (toMaybe x) >>= (toMaybe <<< f)

instance monadNullable :: Monad Nullable

instance extendNullable :: Extend Nullable where
  extend f x = case toMaybe x of
    Just value -> notNull (f x)
    Nothing    -> null
