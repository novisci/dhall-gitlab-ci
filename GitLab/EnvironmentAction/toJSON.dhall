let Prelude = ../Prelude.dhall

let EnvironmentAction = ./Type.dhall

let JSON = Prelude.JSON

let EnvironmentAction/toJSON
    : EnvironmentAction → JSON.Type
    = λ(action : EnvironmentAction) →
        JSON.string
          (merge { Start = "start", Prepare = "prepare", Stop = "stop" } action)

in  EnvironmentAction/toJSON
