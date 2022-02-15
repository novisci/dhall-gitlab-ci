let Prelude = ../Prelude.dhall

let CachePolicy = ./Type.dhall

let JSON = Prelude.JSON

let CachePolicy/toJSON
    : CachePolicy → JSON.Type
    = λ(policy : CachePolicy) →
        JSON.string
          ( merge
              { Pull = "pull", Push = "push", PullPush = "pull-push" }
              policy
          )

in  CachePolicy/toJSON
