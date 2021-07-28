{ name = "nullable"
, dependencies =
  [ "assert"
  , "effect"
  , "functions"
  , "maybe"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
