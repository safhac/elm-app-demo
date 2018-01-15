module Components.Sections.MainSection exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a)
import Html.Styled.Attributes exposing (css, href, src, id)
import Html.Styled.Events exposing (onClick)
import Types exposing (..)
import Styles.Styles exposing (..)
import Routing.Routes exposing (reverseRoute)


renderMain : List Product -> Html Msg
renderMain products =
    main_
        [ centeredTextStyle
        , standardContainerStyle
        ]
        [ mainArea products ]


mainArea : List Product -> Html Msg
mainArea products =
    div
        [ gridContainerStyle ]
        (List.map
            (\p ->
                renderProduct p
            )
            products
        )


renderProduct : Product -> Html Msg
renderProduct product =
    div
        [ standardContainerStyle
        , bufferedContentStyle
        ]
        [ a
            [ href ""
            , onClick (navigateToProduct product.pid)
            ]
            [ text product.name
            , img
                [ src (productsImageFolder ++ product.linkUrl)
                , productIconStyle
                ]
                []
            , text (toString product.price)
            ]
        ]


navigateToProduct : Int -> Msg
navigateToProduct pid =
    reverseRoute (ProductDetails pid)
        |> LinkTo


renderStartPage : Html Msg
renderStartPage =
    div
        [ bufferedContentStyle ]
        [ h2 [] [ text "Welcome" ]
        , div
            [ bufferedContentStyle
            ]
            [ h3 []
                [ a [ onClick Login ] [ text "Have an account? " ]
                , a
                    [ onClick goToRegister ]
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


productsImageFolder : String
productsImageFolder =
    "/static/img/products/"
