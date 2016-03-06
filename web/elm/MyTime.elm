module MyTime where

import Html exposing (..)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp
import Effects exposing (..)

init : (Model, Effects Action)
init =
  ("", Effects.none)

main : Signal Html
main =
  StartApp.start { model = model, view = view, update = update }

type alias Model =
  String

model = ""

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [] [ text model ]
    , button [ onClick address Increment ] [ text "+" ]
    ]


type Action = Increment | Decrement

update : Action -> Model -> Model
update action model =
  case action of
    Increment -> "Incremented"
    Decrement -> "Decremented"

-- SIGNALS

port the_time : Signal Model
