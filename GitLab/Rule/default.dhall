let Prelude = ../../Prelude.dhall

let When = ../When/Type.dhall

let Map = Prelude.Map.Type

in    { `if` = None Text
      , when = None When
      , exists = [] : List Text
      , variables = toMap {=} : Map Text Text
      , changes = [] : List Text
      , allow_failure = None Bool
      }
    : ./Type.dhall
