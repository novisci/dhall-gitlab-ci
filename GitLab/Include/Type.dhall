let Rule = ../Rule/Type.dhall

let Include =
      { artifact : Optional Text
      , local : Optional Text
      , file : Optional Text
      , job : Optional Text
      , remote : Optional Text
      , template : Optional Text
      , rules : List Rule
      , project : Optional Text
      , ref : Optional Text
      }

in  Include
