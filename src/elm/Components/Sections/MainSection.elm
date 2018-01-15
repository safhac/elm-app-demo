module Components.Sections.MainSection exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a)
import Html.Styled.Attributes exposing (css, href, src, id)
import Html.Styled.Events exposing (onClick)
import Types exposing (..)
import Styles.Styles exposing (..)
import Routing.Routes exposing (reverseRoute)
import Components.Sections.ProductDetails exposing (..)
import Helpers.Common exposing (..)
import Components.Pages.Orders exposing (..)


renderMain : Page -> List Product -> Html Msg
renderMain page products =
    main_
        [ centeredTextStyle
        , standardContainerStyle
        ]
        [ case page of
            Home ->
                renderStartPage

            ProductDetails pid ->
                getProductById products pid
                    |> renderProductDetails

            _ ->
                mainArea products
        ]


mainArea : List Product -> Html Msg
mainArea products =
    div
        [ id "gridContainer" ]
        (List.map
            (\p ->
                renderProduct p
            )
            products
        )


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


renderStartPage : Html Msg
renderStartPage =
    div
        [ bufferedContentStyle ]
        [ h2 [] [ text "Welcome" ]
        , div
            [ bufferedContentStyle
            ]
            [ h3 []
                [ a [ linkStyle, onClick Login ] [ text "Have an account? " ]
                , a
                    [ linkStyle, onClick goToRegister ]
                    [ text "Register to enjoy the benefits" ]
                ]
            , text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            ]
        ]


goToRegister : Msg
goToRegister =
    reverseRoute Register
        |> LinkTo


renderUserPage : User -> Html msg
renderUserPage user =
    div
        [ gridContainerStyle ]
        [ h2 [] [ text user.name ]
        , div
            [ bufferedContentStyle
            ]
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ]
        ]


getProductById : List Product -> ProductID -> Product
getProductById products pid =
    let
        maybeProduct =
            find (\p -> p.pid == pid) products

        product =
            case maybeProduct of
                Nothing ->
                    productNotFound

                Just product ->
                    product
    in
        product


find : (a -> Bool) -> List a -> Maybe a
find predicate list =
    case list of
        [] ->
            Nothing

        first :: rest ->
            if predicate first then
                Just first
            else
                find predicate rest


productNotFound : Product
productNotFound =
    { name = ""
    , pid = 0
    , price = 0
    , linkUrl = ""
    }
