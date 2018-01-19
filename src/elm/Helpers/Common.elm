module Helpers.Common exposing (..)

import Types exposing (..)
import Routing.Routes exposing (reverseRoute)
import Dict


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
    , linkUrl = "../spinner.gif"
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
    , sorting = ( Name, True )
    , filtering = Nothing
    }


initialUser : User
initialUser =
    { loginStatus = LoggedOut
    , name = "John"
    , id = 836590
    , email = "john@google.com"
    , avatar = "head-659652_960_720.png"
    , lastViewed = Dict.empty
    }


productsImageFolder : String
productsImageFolder =
    "/static/img/products/"


imageFolder : String
imageFolder =
    "/static/img/"


attrToMsg : Page -> Msg
attrToMsg page =
    reverseRoute page
        |> LinkTo
