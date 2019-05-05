module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, a, div, figure, footer, h1, img, li, p, section, text, ul)
import Html.Attributes exposing (class, href, placeholder, src, style, type_, value)
import Html.Events exposing (onClick)
import Time exposing (Month(..), millisToPosix, toDay, toHour, toMinute, toMonth, toSecond, toYear, utc)



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MODEL


type alias Model =
    { greeting : String
    , times : Int
    , datetime : Int
    }


type alias Flags =
    { greeting : String
    , times : Int
    , datetime : Int
    }


init : Flags -> ( Model, Cmd msg )
init flags =
    ( { greeting = flags.greeting
      , times = flags.times
      , datetime = flags.datetime
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoMessage


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ section [ class "hero is-primary" ]
            [ div [ class "hero-body" ]
                [ div [ class "container" ]
                    [ h1 [ class "title" ]
                        [ text
                            ("Initialized at "
                                ++ String.fromInt (toYear utc (millisToPosix model.datetime))
                                ++ " "
                                ++ (toMonth utc (millisToPosix model.datetime)
                                        |> omissionMonth
                                   )
                                ++ " "
                                ++ String.fromInt (toDay utc (millisToPosix model.datetime))
                                ++ " "
                                ++ String.fromInt
                                    (toHour utc (millisToPosix model.datetime))
                                ++ ":"
                                ++ String.fromInt (toMinute utc (millisToPosix model.datetime))
                                ++ ":"
                                ++ String.fromInt (toSecond utc (millisToPosix model.datetime))
                                ++ " UTC"
                            )
                        ]
                    ]
                ]
            ]
        , section [ class "section" ]
            [ div [ class "container" ]
                [ section []
                    [ figure [ class "image container is-128x128" ]
                        [ img [ src "./logo.svg" ] []
                        ]
                    ]
                ]
            ]
        , section [ class "section" ]
            [ div [ class "container" ]
                [ ul [ class "list is-hoverable" ]
                    (List.repeat model.times
                        (li [ class "list-item" ] [ text model.greeting ])
                    )
                ]
            ]
        , footer [ class "footer" ]
            [ div [ class "content has-text-centered" ]
                [ p []
                    [ a [ href "http://i-doctor.sakura.ne.jp/font/?p=37545" ] [ text "WordPressでフリーオリジナルフォント2" ]
                    ]
                ]
            ]
        ]


omissionMonth : Time.Month -> String
omissionMonth month =
    case month of
        Jan ->
            "Jan"

        Feb ->
            "Feb"

        Mar ->
            "Mar"

        Apr ->
            "Apr"

        May ->
            "May"

        Jun ->
            "Jun"

        Jul ->
            "Jul"

        Aug ->
            "Aug"

        Sep ->
            "Sep"

        Oct ->
            "Oct"

        Nov ->
            "Nov"

        Dec ->
            "Dec"
