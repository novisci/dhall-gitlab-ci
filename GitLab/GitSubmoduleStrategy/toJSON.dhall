let Prelude = ../Prelude.dhall

let GitSubmoduleStrategy = ./Type.dhall

let JSON = Prelude.JSON

let GitSubmoduleStrategy/toJSON
    : GitSubmoduleStrategy → JSON.Type
    = λ(s : GitSubmoduleStrategy) →
        JSON.string (merge { Normal = "normal", Recursive = "recursive" } s)

in  GitSubmoduleStrategy/toJSON
