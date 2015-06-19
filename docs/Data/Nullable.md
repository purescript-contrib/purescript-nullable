## Module Data.Nullable

This module defines types and functions for working with nullable types
using the FFI.

#### `Nullable`

``` purescript
data Nullable :: * -> *
```

A nullable type.

This type constructor may be useful when interoperating with JavaScript functions
which accept or return null values.

##### Instances
``` purescript
instance showNullable :: (Show a) => Show (Nullable a)
instance eqNullable :: (Eq a) => Eq (Nullable a)
instance ordNullable :: (Ord a) => Ord (Nullable a)
```

#### `toNullable`

``` purescript
toNullable :: forall a. Maybe a -> Nullable a
```

Takes `Nothing` to `null`, and `Just a` to `a`.

#### `toMaybe`

``` purescript
toMaybe :: forall a. Nullable a -> Maybe a
```

Represent `null` using `Maybe a` as `Nothing`. 


