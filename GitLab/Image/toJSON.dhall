let Prelude = ../Prelude.dhall

let dropNones = ../utils/dropNones.dhall

let Image = ./Type.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Optional/map = Prelude.Optional.map

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

let Image/toJSON
    : Image → JSON.Type
    = λ(image : Image) →
        let everything
            : Map.Type Text (Optional JSON.Type)
            = toMap
                { name = Some (JSON.string image.name)
                , entrypoint =
                    Optional/map
                      (List Text)
                      JSON.Type
                      stringsArray
                      image.entrypoint
                }

        in  JSON.object (dropNones Text JSON.Type everything)

in  Image/toJSON
