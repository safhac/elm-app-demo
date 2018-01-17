module Server.GetData exposing (..)

import MockHttp exposing (Endpoint(..))
import Json.Decode as Decode exposing (Decoder, field, at, list, string, int, float, map4)
import Types exposing (Product)


config : MockHttp.Config
config =
    MockHttp.config
        [ Get
            { url = "https://api/data/products"
            , response = """[{"name":"Clown","pid":1,"price":9.90,"linkUrl":"item01.jpeg"},{"name":"Special","pid":2,"price":19.90,"linkUrl":"item02.jpeg"},{"name":"Shoes","pid":3,"price":29.90,"linkUrl":"item03.jpeg"},{"name":"Stroller","pid":4,"price":39.90,"linkUrl":"item04.jpeg"},{"name":"Car","pid":5,"price":149.90,"linkUrl":"item05.jpeg"},{"name":"Hellicopter","pid":6,"price":529.90,"linkUrl":"item06.jpeg"}]"""
            , responseTime = 2500
            }
        ]


getProducts : MockHttp.Request (List Product)
getProducts =
    MockHttp.get "https://api/data/products" (list decodeProduct)


decodeProduct : Decode.Decoder Product
decodeProduct =
    map4 newProduct
        (field "name" Decode.string)
        (field "pid" Decode.int)
        (field "price" Decode.float)
        (field "linkUrl" Decode.string)


newProduct : String -> Int -> Float -> String -> Product
newProduct name pid price linkUrl =
    { name = name
    , pid = pid
    , price = price
    , linkUrl = linkUrl
    }
