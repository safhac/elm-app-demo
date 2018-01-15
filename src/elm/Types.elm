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
    | Register
    | UrlNotFound


type alias State =
    { currentPage : Page
    , user : User
    }


type alias ProductID =
    Int
