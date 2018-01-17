module Components.Pages.AllPages exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a)
import Html.Styled.Attributes exposing (css, href, src, id)
import Html.Styled.Events exposing (onClick)
import Routing.Routes exposing (..)
import Types exposing (..)
import Styles.Styles exposing (..)
import Helpers.Common exposing (..)


view =
    ""


renderOrder : Types.Order -> Html Msg
renderOrder order =
    div [] []


renderProfile : User -> Html Msg
renderProfile user =
    div []
        [ img [ src (imageFolder ++ user.avatar) ] []
        , h2 []
            [ user.name
                ++ " profile"
                |> text
            ]
        ]


renderPage : Page -> Html Msg
renderPage page =
    let
        message =
            "Welcome to the "
                ++ reverseRoute page
                ++ " page"
    in
        div []
            [ h2 []
                [ text message
                ]
            ]
