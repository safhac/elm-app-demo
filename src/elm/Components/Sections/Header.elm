module Components.Sections.Header exposing (..)

import Html.Styled exposing (Html, a, button, div, aside, header, nav, ul, li, img, text, h1)
import Html.Styled.Attributes exposing (attribute, href, src, style, class, id, css)
import Html.Styled.Events exposing (onClick)
import Routing.Routes exposing (..)
import Types exposing (..)
import Styles.Styles exposing (..)
import Helpers.Common exposing (..)


renderHeader : State -> Html Msg
renderHeader state =
    header
        headerStyles
        [ logo
        , banner
        , navbar state.currentPage
        , renderUserIcon state.user
        ]


renderUserIcon : User -> Html Msg
renderUserIcon user =
    let
        { path, message, link } =
            if user.loginStatus == LoggedIn then
                { path = imageFolder ++ user.avatar
                , message = text "Logout"
                , link = (LinkTo <| "/myprofile")
                }
            else
                { path = imageFolder ++ "login.jpeg"
                , message = text "Login"
                , link = Login
                }
    in
        aside
            [ verticalCenterStyle
            ]
            [ img
                [ userPicStyle
                , id "userIcon"
                , src path
                ]
                []
            , div
                [ id "fadeIn"
                , showLogin
                ]
                [ a
                    [ loginButtonStyle
                    , onClick link
                    ]
                    [ message ]
                ]
            ]


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
    h1
        [ headingStyle
        ]
        [ text "Company Name"
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
