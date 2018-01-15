module Routing.Routes exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)
import Types exposing (Msg(..), Page(..))


reverseRoute : Page -> String
reverseRoute page =
    case page of
        Home ->
            "/home"

        Products ->
            "/products"

        MyProfile ->
            "/myprofile"

        ProductDetails prodId ->
            "/product/" ++ (toString prodId)

        About ->
            "/about"

        UrlNotFound ->
            "/404"


route : Parser (Page -> a) a
route =
    oneOf
        [ map Home (s "home")
        , map Products (s "products")
        , map MyProfile (s "myprofile")
        , map About (s "about")
        , map ProductDetails (s "product" </> int)
        , map UrlNotFound (s "404")
        ]


parseLocation : Location -> Msg
parseLocation location =
    let
        parsedRoute =
            parsePath route location

        curr =
            Debug.log "route " parsedRoute
    in
        parsedRoute
            |> NavigateTo
