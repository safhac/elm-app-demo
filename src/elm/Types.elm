module Types exposing (..)

import Http


type alias Model =
    { products : List Product
    , state : State
    }


type Msg
    = LinkTo String
    | NavigateTo (Maybe Page)
    | Login
    | ProductsFetched (Result Http.Error (List Product))
    | Ordering Product
    | SortProducts SortBy


type alias Product =
    { name : String
    , pid : Int
    , price : Float
    , linkUrl : String
    }


type alias User =
    { loginStatus : LoginStatus
    , name : String
    , id : Int
    , email : String
    , avatar : String
    }


type LoginStatus
    = LoggedIn
    | LoggedOut
    | DisplayLogIn
    | Unregisterred


type Page
    = Home
    | Products
    | MyProfile
    | About
    | ProductDetails ProductID
    | Order OrderID
    | Register
    | UrlNotFound


type alias State =
    { currentPage : Page
    , user : User
    , productUX : ProductsUXState
    }


type alias ProductsUXState =
    SortBy


type LengthProperty
    = Height
    | Width


type SortBy
    = Price Bool
    | Name Bool
    | Category Bool
    | Rating Bool


type X
    = Up
    | Down


type alias ProductID =
    Int


type alias OrderID =
    Int


type alias Order =
    ()
