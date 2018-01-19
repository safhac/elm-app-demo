module Actions.Operations exposing (..)

import Types exposing (SortBy(..), Product, ProductsFilterBy(..))
import Helpers.Common exposing (initialProduct)


filterList : ProductsFilterBy -> List Product -> List Product
filterList filter list =
    case filter of
        ByMinPriceRange minprice ->
            let
                filteredList =
                    filterByPrice list minprice
            in
                filteredList

        ByCategoryName category ->
            let
                filteredList =
                    filterByCategory list category
            in
                filteredList


filterByPrice : List Product -> String -> List Product
filterByPrice list minprice =
    let
        priceFloat =
            case String.toFloat minprice of
                Ok res ->
                    res

                Err err ->
                    0

        filteredList =
            List.filter (\p -> p.price > priceFloat) list
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
