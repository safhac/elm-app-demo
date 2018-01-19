module Components.Pages.AllPages exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a, p)
import Html.Styled.Attributes exposing (css, href, src, id, class)
import Html.Styled.Events exposing (onClick)
import Routing.Routes exposing (..)
import Types exposing (..)
import Styles.Styles exposing (..)
import Helpers.Common exposing (..)


renderOrder : Types.Order -> Html Msg
renderOrder order =
    div [] []


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


renderProfile : User -> Html Msg
renderProfile user =
    div [ class "gridContainer" ]
        [ img
            [ profilePicStyle
            , src (imageFolder ++ user.avatar)
            ]
            []
        , h2 []
            [ user.name
                ++ " profile"
                |> text
            ]
        , div []
            [ myLatestProducts user.lastViewed ]
        ]


myLatestProducts : List Product -> Html Msg
myLatestProducts latest =
    let
        lastViewd =
            if (List.length latest > 0) then
                div []
                    [ p [] [ text "products you viewed lately" ]
                    , div []
                        (List.map
                            (\product -> renderProduct product)
                            latest
                        )
                    ]
            else
                div [] []
    in
        lastViewd


renderProduct : Product -> Html Msg
renderProduct product =
    let
        fromPrice =
            toString product.price

        price =
            if fromPrice == "0" then
                ""
            else
                fromPrice
    in
        div
            [ standardContainerStyle
            , bufferedContentStyle
            ]
            [ a
                [ linkStyle
                , onClick (attrToMsg <| ProductDetails product.pid)
                ]
                [ text product.name
                , img
                    [ src (productsImageFolder ++ product.linkUrl)
                    , productIconStyle
                    ]
                    []
                , text price
                ]
            ]
