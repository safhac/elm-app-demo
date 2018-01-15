module Components.Sections.Header exposing (..)

import Css exposing (..)
import Html.Styled exposing (Html, a, map, button, div, header, nav, ul, li, img, span, text, aside, section, h1, h2)
import Html.Styled.Attributes exposing (attribute, href, src, style, class, id, css)
import Html.Styled.Events exposing (onClick)
import Routing.Routes exposing (..)
import Types exposing (..)
import Styles.Styles exposing (..)


renderHeader : State -> Html Msg
renderHeader state =
    header
        [ headerStyle ]
        [ logo
        , banner
        , navbar state.currentPage
        , userBar state.user
        ]


userBar : User -> Html Msg
userBar user =
    div [ bufferedContentStyle ]
        [ renderUserIcon user
        ]


renderUserIcon : User -> Html Msg
renderUserIcon user =
    case user.loginStatus of
        LoggedIn ->
            let
                imgSrc =
                    "static/img/" ++ user.avatar
            in
                a
                    [ standardContainerStyle
                    , onClick (LinkTo <| "/myprofile")
                    ]
                    [ img
                        [ src imgSrc
                        , userPicStyle
                        ]
                        []
                    , text "View profile"
                    ]

        _ ->
            div []
                [ img
                    [ src "static/img/login.jpeg"
                    , userPicStyle
                    ]
                    []
                , div
                    [ id "fadeIn"
                    , showLogin
                    ]
                    [ a
                        [ loginButtonStyle
                        , onClick Login
                        ]
                        [ text "login" ]
                    ]
                ]



--logInIcon


displayLoginButton user =
    { user | loginStatus = DisplayLogIn }


navbar : Page -> Html Msg
navbar currentPage =
    let
        linksList =
            List.filter (currentPage |> (/=)) [ Home, Products, MyProfile, About ]
    in
        nav []
            [ ul [ navStyle ]
                (List.map renderLink linksList)
            ]


banner : Html msg
banner =
    div []
        [ h1 [ css [ lineHeight (px 100) ] ]
            [ text "Company Name"
            ]
        ]


renderLink : Page -> Html Msg
renderLink route =
    let
        words =
            reverseRoute route
    in
        li [ inlineNavStyle ]
            [ a
                [ navLinkStyle
                , onClick (LinkTo words)
                ]
                [ text words ]
            ]
