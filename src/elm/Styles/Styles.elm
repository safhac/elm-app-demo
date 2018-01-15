module Styles.Styles exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)


topPanelHeight : Px
topPanelHeight =
    (px 100)


standardContainerStyle : Attribute msg
standardContainerStyle =
    css
        [ displayFlex
        , textAlign center
        , flex (int 1)
        , flexDirection column
        ]


gridContainerStyle : Attribute msg
gridContainerStyle =
    css
        [ display inlineFlex
        , textAlign center
        , flex (int 1)
        ]


centeredTextStyle : Attribute msg
centeredTextStyle =
    css
        [ textAlign center
        , justifyContent center
        , margin2 (px 0) auto
        ]


bufferedContentStyle : Attribute msg
bufferedContentStyle =
    css
        [ padding2 (px 5) (px 25)
        ]


productIconStyle : Attribute msg
productIconStyle =
    css
        [ display inlineBlock
        , height topPanelHeight
        , width topPanelHeight
        ]


logo : Html msg
logo =
    img
        [ src "static/img/cow-35561_960_720.png"
        , css
            [ display inlineBlock
            , height topPanelHeight
            , width topPanelHeight
            , border3 (px 1) solid (rgb 255 255 255)
            , padding (px 15)
            , hover
                [ borderColor theme.primary
                , border3 (px 1) solid (rgb 120 120 120)
                , borderRadius (px 10)
                ]
            ]
        ]
        []


logInIcon : Html msg
logInIcon =
    img
        [ src "static/img/login.jpeg"
        , css
            [ display inlineBlock
            , cursor pointer
            , height (px 50)
            , width (px 50)
            , padding (px 15)
            , opacity (num 0.3)
            , hover
                [ opacity (num 1)
                ]
            ]
        ]
        []


headerStyle =
    css
        [ displayFlex
        , textAlign center
        , justifyContent spaceBetween
        ]


navStyle : Attribute msg
navStyle =
    css
        [ listStyleType none
        , margin (px 0)
        , padding (px 0)
        , lineHeight topPanelHeight
        ]


inlineNavStyle =
    css
        [ display inlineBlock
        , width (px 100)
        ]


navLinkStyle : Attribute msg
navLinkStyle =
    css
        [ padding2 (px 14) (px 16)
        , cursor pointer
        , hover
            [ color (rgb 250 250 250)
            , backgroundColor (rgb 50 25 60)
            ]
        ]


userPicStyle : Attribute msg
userPicStyle =
    css
        [ display inlineBlock
        , cursor pointer
        , height (px 50)
        , width (px 50)
        , padding (px 15)
        , opacity (num 0.3)
        , hover
            [ opacity (num 1)
            ]
        ]


bannerStyle : Attribute msg
bannerStyle =
    css [ lineHeight topPanelHeight ]


showLogin : Attribute msg
showLogin =
    css
        [ opacity (num 0)
        , cursor pointer
        , top (px 0)
        , position absolute
        , width (px 100)
        , height (px 150)
        , alignItems flexEnd
        , displayFlex
        , justifyContent center
        ]


linkStyle : Attribute msg
linkStyle =
    css
        [ cursor pointer
        ]


loginButtonStyle : Attribute msg
loginButtonStyle =
    css
        [ margin (px 12)
        , color (rgb 250 250 250)
        , backgroundColor (rgb 50 25 60)
        , padding2 (px 1) (px 15)
        ]


theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }
