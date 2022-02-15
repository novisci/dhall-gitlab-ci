let Prelude = ../Prelude.dhall

let Trigger = ./Type.dhall

let TriggerStrategy = ../TriggerStrategy/package.dhall

let Include = ../Include/package.dhall

let dropNones = ../utils/dropNones.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Trigger/toJSON
    : Trigger → JSON.Type
    = λ(trigger : Trigger) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { project =
                    Prelude.Optional.map
                      Text
                      JSON.Type
                      JSON.string
                      trigger.project
                , branch =
                    Prelude.Optional.map
                      Text
                      JSON.Type
                      JSON.string
                      trigger.branch
                , include =
                    if    Prelude.List.null Include.Type trigger.include
                    then  None JSON.Type
                    else  Some
                            ( JSON.array
                                ( Prelude.List.map
                                    Include.Type
                                    JSON.Type
                                    Include.toJSON
                                    trigger.include
                                )
                            )
                , strategy =
                    Prelude.Optional.map
                      TriggerStrategy.Type
                      JSON.Type
                      TriggerStrategy.toJSON
                      trigger.strategy
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Trigger/toJSON
