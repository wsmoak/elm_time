module MyTime where

import Html exposing (..)
import Html.Events exposing (onClick)
import StartApp
import Effects exposing (..)

init : (Model, Effects Action)
init =
  ("", Effects.none)

-- main : Signal Html
app =
  StartApp.start {
    init = init,
    update = update ,
    view = view,
    inputs = [incomingActions]
    }

main : Signal Html
main =
  app.html

type alias Model =
  String

model = ""

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [
      div [] [ text model ]
    ]


type Action =  SetTime Model

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    SetTime the_time -> (the_time, Effects.none)

incomingActions : Signal Action
incomingActions =
  Signal.map SetTime the_time

-- SIGNALS

port the_time : Signal Model
