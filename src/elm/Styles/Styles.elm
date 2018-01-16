module Styles.Styles exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src, property, style)


{-| Responsive functions
@docs responsive


# Responsive functions

-}
topPanelHeight : Px
topPanelHeight =
    (px 100)


{-| Named styling
@docs css


# Named css classes

-}
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


{-| Responsive content
@docs Responsive


# Responsive content

-}
logo : Html msg
logo =
    img
        [ src "static/img/cow-35561_960_720.png"
        , css
            [ display inlineBlock
            , margin2 auto (px 15)
            , height (vmin 8)
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
            , margin2 auto (px 0)
            , opacity (num 0.3)
            , height (vmax 6)
            , hover
                [ opacity (num 1)
                ]
            ]
        ]
        []


{-| Header css
@docs Styles


# Header styles

-}
headerStyles : List (Attribute msg)
headerStyles =
    [ css
        [ displayFlex
        , textAlign center
        , justifyContent spaceBetween
        , height (vh 10)
        , backgroundColor (hex "d3d3d3")
        ]
    ]


navStyle : Attribute msg
navStyle =
    css
        [ listStyleType none
        , margin (px 0)
        , padding (px 0)
        , fontSize (vmin 2)
        , lineHeight (vh 10)
        ]


inlineNavStyle : Attribute msg
inlineNavStyle =
    css
        [ display inlineBlock
        , width (vmin 10)
        ]


navLinkStyle : Attribute msg
navLinkStyle =
    css
        [ cursor pointer
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
        , margin2 auto (px 0)
        , height (vmax 5)
        , opacity (num 0.3)
        , hover
            [ opacity (num 1)
            ]
        ]


bannerStyle : Attribute msg
bannerStyle =
    css [ lineHeight (vmax 10) ]


headingStyle : Attribute msg
headingStyle =
    css
        [ fontSize (vmin 3)
        , lineHeight (vh 10)
        ]


showLogin : Attribute msg
showLogin =
    css
        [ opacity (num 0)
        , position absolute
        , cursor pointer
        , top (px 0)
        , width (vw 5)
        , height (vmax 6)
        , alignItems flexEnd
        , displayFlex
        , justifyContent center
        ]


linkStyle : Attribute msg
linkStyle =
    css
        [ cursor pointer
        ]


buyNowStyle : Attribute msg
buyNowStyle =
    css
        [ backgroundColor (rgb 250 250 250)
        , border3 (px 1) solid (hex "d3d3d3")
        , cursor pointer
        , margin2 (px 15) auto
        , padding (px 15)
        ]


loginButtonStyle : Attribute msg
loginButtonStyle =
    css
        [ margin (px 12)
        , color (rgb 250 250 250)
        , backgroundColor (rgb 50 25 60)
        , padding2 (px 1) (px 15)
        ]


{-| Theming
@docs Styles


# Theme styles

-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }


verticalCenterStyle =
    css
        [ margin2 auto (px 0)
        ]
