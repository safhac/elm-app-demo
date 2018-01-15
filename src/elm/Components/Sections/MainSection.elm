module Components.Sections.MainSection exposing (..)

import Html.Styled exposing (Html, div, text, main_, img, h2)
import Html.Styled.Attributes exposing (css, href, src, id)
import Types exposing (..)
import Styles.Styles exposing (..)


renderMain : List Product -> Html msg
renderMain products =
    main_
        [ centeredTextStyle
        , standardContainerStyle
        ]
        [ mainArea products ]


mainArea : List Product -> Html msg
mainArea products =
    div
        [ gridContainerStyle ]
        (List.map
            (\p ->
                renderProduct p
            )
            products
        )


renderProduct : Product -> Html msg
renderProduct product =
    div
        [ standardContainerStyle
        , bufferedContentStyle
        ]
        [ img
            [ src product.linkUrl
            , productIconStyle
            ]
            []
        , text product.name
        ]


renderStartPage : Html msg
renderStartPage =
    div
        [ bufferedContentStyle ]
        [ h2 [] [ text "Welcom" ]
        , div
            [ bufferedContentStyle
            ]
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ]
        ]


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
