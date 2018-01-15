module Main exposing (..)

import Html.Styled exposing (..)
import Navigation exposing (Location, newUrl)
import UrlParser exposing (..)
import MockHttp exposing (Endpoint(..))
import Routing.Routes exposing (..)
import View exposing (..)
import Types exposing (LoginStatus(..), User, Product, Model, Msg(..), Page(..), ProductID, State)
import Server.GetData exposing (config, getProducts)


main : Program Never Model Msg
main =
    Navigation.program parseLocation
        { init = init
        , view = view >> toUnstyled
        , update = update
        , subscriptions = subscriptions
        }


initialModel : Model
initialModel =
    { products = [ initialProduct ]
    , state = initialState
    }


initialProduct : Product
initialProduct =
    { name = ""
    , pid = 0
    , price = 0
    , linkUrl = ""
    }


initializeProduct : Types.ProductID -> Product
initializeProduct pid =
    { name = "Item " ++ toString pid
    , pid = pid
    , price = 9.99
    , linkUrl = ""
    }


initialState : State
initialState =
    { user = initialUser
    , currentPage = Home
    }


initialUser : User
initialUser =
    { loginStatus = LoggedOut
    , name = "John"
    , id = 836590
    , email = "john@google.com"
    , avatar = "head-659652_960_720.png"
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            case parseHash route location of
                Nothing ->
                    Home

                Just page ->
                    page

        newState : State
        newState =
            { initialState | currentPage = page }
    in
        ( { initialModel | state = newState }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavigateTo maybePage ->
            case maybePage of
                Nothing ->
                    { model | state = initialState }
                        ! [ Cmd.none ]

                Just page ->
                    let
                        oldState =
                            model.state

                        newState =
                            { oldState | currentPage = page }
                    in
                        ( { model | state = newState }, Cmd.none )

        LinkTo path ->
            ( model, newUrl path )

        Login ->
            let
                oldState =
                    model.state

                currUser =
                    oldState.user

                updatedUser : User
                updatedUser =
                    { currUser | loginStatus = LoggedIn }

                newState =
                    { oldState | user = updatedUser }
            in
                ( { model | state = newState }
                , MockHttp.send config ProductsFetched getProducts
                )

        ProductsFetched (Ok result) ->
            let
                p =
                    Debug.log "p " result
            in
                ( { model | products = result }
                , Cmd.none
                )

        ProductsFetched (Err error) ->
            let
                p =
                    Debug.log "p " error
            in
                model ! []
