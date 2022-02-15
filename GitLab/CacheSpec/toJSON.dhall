let Prelude = ../Prelude.dhall

let CacheSpec = ./Type.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let List/map = Prelude.List.map

let CacheSpec/toJSON
    : CacheSpec → JSON.Type
    = λ(cs : CacheSpec) →
        let obj
            : Map.Type Text JSON.Type
            = toMap
                { key = JSON.string cs.key
                , paths =
                    JSON.array (List/map Text JSON.Type JSON.string cs.paths)
                }

        in  JSON.object obj

in  CacheSpec/toJSON
