module Actions.Operations exposing (..)

import Dict
import Types exposing (User, ProductID, SortBy(..), Product, ProductsFilterBy(..))
import Helpers.Common exposing (initialProduct)


filterList : Maybe ProductsFilterBy -> List Product -> List Product
filterList maybeFilter list =
    case maybeFilter of
        Nothing ->
            list

        Just (ByPriceRange minprice maxprice) ->
            let
                filteredList =
                    filterByPrice list minprice maxprice
            in
                filteredList

        Just (ByCategoryName category) ->
            let
                filteredList =
                    filterByCategory list category
            in
                filteredList


filterByPrice : List Product -> String -> String -> List Product
filterByPrice list minprice maxprice =
    let
        minPriceFloat =
            case String.toFloat minprice of
                Ok res ->
                    res

                Err err ->
                    0

        maxPriceFloat =
            case String.toFloat maxprice of
                Ok mres ->
                    mres

                Err err ->
                    0

        filteredList =
            List.filter (\p -> p.price > minPriceFloat && p.price < maxPriceFloat) list
    in
        filteredList



-- TODO add category to Product


filterByCategory : List Product -> String -> List Product
filterByCategory list category =
    List.filter (\p -> p.name == category) list



{- Sorting



-}


sortListBy : List Product -> SortBy -> Bool -> List Product
sortListBy unSortedList sortABy dir =
    let
        sortedList =
            case sortABy of
                Name ->
                    List.sortBy .name unSortedList

                Price ->
                    List.sortBy .price unSortedList

                Category ->
                    List.sortBy .name unSortedList

                Rating ->
                    List.sortBy .name unSortedList
    in
        case dir of
            True ->
                sortedList

            False ->
                List.reverse sortedList


getMinMaxPrices : List Product -> ( Float, Float )
getMinMaxPrices list =
    let
        sorted =
            sortListBy list Price True

        min =
            sorted
                |> List.head
                |> Maybe.withDefault initialProduct

        max =
            sorted
                |> List.reverse
                |> List.head
                |> Maybe.withDefault initialProduct
    in
        ( min.price, max.price )


getProductById : List Product -> ProductID -> Product
getProductById products pid =
    let
        maybeProduct =
            find (\p -> p.pid == pid) products

        product =
            case maybeProduct of
                Nothing ->
                    productNotFound

                Just product ->
                    product
    in
        product


find : (a -> Bool) -> List a -> Maybe a
find predicate list =
    case list of
        [] ->
            Nothing

        first :: rest ->
            if predicate first then
                Just first
            else
                find predicate rest


productNotFound : Product
productNotFound =
    { name = ""
    , pid = 0
    , price = 0
    , linkUrl = ""
    }


updateUserWatchList : User -> List Product -> ProductID -> User
updateUserWatchList user products pid =
    let
        p =
            getProductById products pid

        newDict2 =
            Dict.insert
                pid
                p
                user.lastViewed

        newUser =
            { user | lastViewed = newDict2 }
    in
        newUser
