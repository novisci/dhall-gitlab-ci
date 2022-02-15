let Prelude = ../Prelude.dhall

let Include = ./Type.dhall

let Rule = ../Rule/package.dhall

let dropNones = ../utils/dropNones.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Include/toJSON
    : Include → JSON.Type
    = λ(include : Include) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { artifact =
                    Prelude.Optional.map
                      Text
                      JSON.Type
                      JSON.string
                      include.artifact
                , local =
                    Prelude.Optional.map
                      Text
                      JSON.Type
                      JSON.string
                      include.local
                , file =
                    Prelude.Optional.map Text JSON.Type JSON.string include.file
                , job =
                    Prelude.Optional.map Text JSON.Type JSON.string include.job
                , remote =
                    Prelude.Optional.map
                      Text
                      JSON.Type
                      JSON.string
                      include.remote
                , template =
                    Prelude.Optional.map
                      Text
                      JSON.Type
                      JSON.string
                      include.template
                , rules =
                    if    Prelude.List.null Rule.Type include.rules
                    then  None JSON.Type
                    else  Some
                            ( JSON.array
                                ( Prelude.List.map
                                    Rule.Type
                                    JSON.Type
                                    Rule.toJSON
                                    include.rules
                                )
                            )
                , project =
                    Prelude.Optional.map
                      Text
                      JSON.Type
                      JSON.string
                      include.project
                , ref =
                    Prelude.Optional.map Text JSON.Type JSON.string include.ref
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Include/toJSON
