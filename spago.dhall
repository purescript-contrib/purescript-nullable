{ name = "nullable"
, dependencies =
  [ "assert", "console", "effect", "functions", "maybe", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
