let Prelude = ../Prelude.dhall

let Duration = ./Type.dhall

let JSON = Prelude.JSON

let formatDur
    : Duration → Text
    = λ(dur : Duration) → "${Natural/show dur.seconds} second"

let Duration/toJSON
    : Duration → JSON.Type
    = λ(dur : Duration) → JSON.string (formatDur dur)

in  Duration/toJSON
