let config = ./spago.dhall
in config //
  { dependencies =
      config.dependencies
  , sources =
      config.sources #
        [ "examples/**/*.purs"
        ]
  }
