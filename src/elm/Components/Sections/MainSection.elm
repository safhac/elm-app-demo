module Components.Sections.MainSection exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2, h3, a, button)
import Html.Styled.Attributes exposing (css, href, src, id)
import Html.Styled.Events exposing (onClick)
import Types exposing (LoginStatus(..), User, Product, Model, Msg(..), Page(..), ProductID, State, SortBy(..), X(..))
import Styles.Styles exposing (..)
import Routing.Routes exposing (reverseRoute)
import Components.Sections.ProductDetails exposing (..)
import Helpers.Common exposing (..)
import Components.Pages.AllPages exposing (..)


renderMain : Model -> Html Msg
renderMain model =
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
                renderProfile model.state.user

            Products ->
                mainArea model.products model.state

            _ ->
                renderPage model.state.currentPage
        ]


mainArea : List Product -> State -> Html Msg
mainArea products state =
    let
        sortedProducts =
            orderProductList products state.productUX
    in
        div []
            [ div [ sortFilterContainerStyle ]
                [ div [ leftFloatStyle ] [ text "filter" ]

                -- , input
                --         [ type_ "range"
                --         , Html.Attributes.min "0"
                --         , Html.Attributes.max "500"
                --         , value minEntryFee
                --         , value maxEntryFee
                --         , onInput (\entryFee -> FilterCompetitionListBy (ByFeeRange ( minEntryFee, maxEntryFee, entryFee )))
                , div [ leftFloatStyle, sortStyle ]
                    [ button [ sortButtonStyle, onClick (SortProducts (Price True)) ] [ text "Price" ]
                    , button [ sortButtonStyle, onClick (SortProducts (Name True)) ] [ text "Name" ]
                    , button [ sortButtonStyle, onClick (SortProducts (Price False)) ] [ text "Category" ]
                    ]
                ]
            , div
                [ id "gridContainer" ]
                (List.map
                    (\product ->
                        renderProduct product
                    )
                    sortedProducts
                )
            ]


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
    main_
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


orderProductList : List Product -> SortBy -> List Product
orderProductList unSortedList sortProductsBy =
    let
        s =
            Debug.log "order" sortProductsBy
    in
        case sortProductsBy of
            Name True ->
                List.sortBy .name unSortedList

            Name False ->
                List.sortBy .name unSortedList

            Price True ->
                List.sortBy .price unSortedList

            Price False ->
                List.sortBy .price unSortedList

            Category True ->
                List.sortBy .name unSortedList

            Category False ->
                List.sortBy .name unSortedList

            Rating True ->
                List.sortBy .name unSortedList

            Rating False ->
                List.sortBy .name unSortedList


flippedComparison a b =
    case compare a b of
        LT ->
            GT

        EQ ->
            EQ

        GT ->
            LT
