module Components.Sections.MainSection exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a, button, input, label, p)
import Html.Styled.Attributes exposing (css, href, src, id, class, type_, min, max, value)
import Html.Styled.Events exposing (onClick, onInput)
import Types exposing (LoginStatus(..), User, Product, Model, Msg(..), Page(..), ProductID, State, SortBy(..), ProductsFilterBy(..))
import Styles.Styles exposing (..)
import Routing.Routes exposing (reverseRoute)
import Components.Sections.ProductDetails exposing (..)
import Helpers.Common exposing (..)
import Components.Pages.AllPages exposing (..)
import Actions.Operations exposing (..)


renderMain : Model -> Html Msg
renderMain model =
    let
        userLoggedIn =
            model.state.user.loginStatus == LoggedIn
    in
        main_
            [ centeredTextStyle
            , standardContainerStyle
            ]
            [ case model.state.currentPage of
                Home ->
                    renderStartPage

                ProductDetails pid ->
                    getProductById model.products pid
                        |> renderProductDetails

                MyProfile ->
                    if userLoggedIn then
                        renderProfile model.state.user
                    else
                        renderPage Register

                Products ->
                    if userLoggedIn then
                        mainArea model.products model.state
                    else
                        renderStartPage

                UrlNotFound ->
                    renderPage UrlNotFound

                _ ->
                    renderPage model.state.currentPage
            ]


mainArea : List Product -> State -> Html Msg
mainArea products state =
    let
        filteredProds =
            filterList state.filtering products

        ( minPrice, maxPrice ) =
            getMinMaxPrices products

        ( currMinPrice, currMaxPrice ) =
            getMinMaxPrices filteredProds

        minPriceString =
            toString minPrice

        maxPriceString =
            toString (maxPrice + 100)

        currMinPriceString =
            toString currMinPrice

        currMaxPriceString =
            toString currMaxPrice

        filterText =
            currMinPriceString ++ " to " ++ currMaxPriceString
    in
        div []
            [ div [ sortFilterContainerStyle ]
                [ div [ leftFloatStyle ]
                    [ p [ onClick ResetProductsFilter ]
                        [ button [] [ text "Reset" ]
                        , text filterText
                        ]
                    , p []
                        [ input
                            [ type_ "range"
                            , Html.Styled.Attributes.min "0"
                            , Html.Styled.Attributes.max maxPriceString
                            , value currMinPriceString
                            , onInput (\minProdPrice -> FilterProducts (ByPriceRange minProdPrice maxPriceString))
                            ]
                            []
                        , input
                            [ type_ "range"
                            , Html.Styled.Attributes.min minPriceString
                            , Html.Styled.Attributes.max maxPriceString
                            , value currMaxPriceString
                            , onInput (\maxProdPrice -> FilterProducts (ByPriceRange "0" maxProdPrice))
                            ]
                            []
                        ]
                    ]
                , div [ leftFloatStyle, sortStyle ]
                    [ button [ sortButtonStyle, onClick (SortProducts Price) ] [ text "Price" ]
                    , button [ sortButtonStyle, onClick (SortProducts Name) ] [ text "Name" ]
                    , button [ sortButtonStyle, onClick (SortProducts Price) ] [ text "Category" ]
                    ]
                ]
            , div
                [ class "gridContainer" ]
                (List.map
                    (\product ->
                        renderProduct product
                    )
                    filteredProds
                )
            ]


renderStartPage : Html Msg
renderStartPage =
    main_
        [ bufferedContentStyle ]
        [ h2 [] [ text "Welcome" ]
        , div
            [ bufferedContentStyle
            ]
            [ h3 []
                [ text "Have an account? "
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
