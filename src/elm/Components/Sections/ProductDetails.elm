module Components.Sections.ProductDetails exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a, button)
import Html.Styled.Attributes exposing (css, href, src, id, class)
import Html.Styled.Events exposing (onClick)
import Routing.Routes exposing (..)
import Types exposing (..)
import Styles.Styles exposing (..)
import Helpers.Common exposing (..)


renderProductDetails : Product -> Html Msg
renderProductDetails product =
    div [ standardContainerStyle ]
        [ h2 [] [ text product.name ]
        , img [ src (productsImageFolder ++ product.linkUrl) ] []
        , product.price
            |> toString
            |> text
        , button [] [ text "Buy now" ]
        ]
