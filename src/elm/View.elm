module View exposing (..)

import Html.Styled exposing (Html, map, div, header, main_)
import Html.Styled.Attributes exposing (id, css)
import Types exposing (..)
import Styles.Styles exposing (..)
import Components.Sections.Header exposing (..)
import Components.Sections.MainSection exposing (..)


view : Model -> Html Msg
view { products, state } =
    div [ id "view", standardContainerStyle ]
        [ renderHeader state
        , case state.user.loginStatus of
            LoggedIn ->
                renderMain state.currentPage products

            _ ->
                renderStartPage
        ]
