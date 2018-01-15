module Components.Pages.Orders exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a)
import Html.Styled.Attributes exposing (css, href, src, id)
import Html.Styled.Events exposing (onClick)
import Routing.Routes exposing (..)
import Types exposing (..)
import Styles.Styles exposing (..)


view =
    ""


renderOrder : Types.Order -> Html Msg
renderOrder order =
    div [] []
