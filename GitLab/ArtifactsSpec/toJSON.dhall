let Prelude = ../Prelude.dhall

let ArtifactsSpec = ../ArtifactsSpec/Type.dhall

let When/toJSON = ../When/toJSON.dhall

let Duration/toJSON = ../Duration/toJSON.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let List/map = Prelude.List.map

let ArtifactsSpec/toJSON
    : ArtifactsSpec → JSON.Type
    = λ(cs : ArtifactsSpec) →
        let obj
            : Map.Type Text JSON.Type
            = toMap
                { when = When/toJSON cs.when
                , expire_in = Duration/toJSON cs.expire_in
                , paths =
                    JSON.array (List/map Text JSON.Type JSON.string cs.paths)
                }

        in  JSON.object obj

in  ArtifactsSpec/toJSON
