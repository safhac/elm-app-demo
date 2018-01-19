module Types exposing (..)

import Http


type alias Model =
    { products : List Product
    , state : State
    }


type alias User =
    { loginStatus : LoginStatus
    , name : String
    , id : Int
    , email : String
    , avatar : String
    }


type alias Product =
    { name : String
    , pid : Int
    , price : Float
    , linkUrl : String
    }


type alias State =
    { currentPage : Page
    , user : User
    , sorting : ( SortBy, Bool )
    , filtering : Maybe ProductsFilterBy
    }


type Msg
    = LinkTo String
    | NavigateTo (Maybe Page)
    | Login
    | ProductsFetched (Result Http.Error (List Product))
    | Ordering Product
    | SortProducts SortBy
    | FilterProducts ProductsFilterBy
    | ResetProductsFilter


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


type LengthProperty
    = Height
    | Width


type SortBy
    = Price
    | Name
    | Category
    | Rating


type ProductsFilterBy
    = ByPriceRange String String
    | ByCategoryName String


type alias ResStrFloat =
    Result String Float


type alias ProductID =
    Int


type alias OrderID =
    Int


type alias Order =
    ()
