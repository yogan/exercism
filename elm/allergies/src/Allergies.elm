module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise exposing (and)


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergies : List ( Int, Allergy )
allergies =
    [ ( 1, Eggs )
    , ( 2, Peanuts )
    , ( 4, Shellfish )
    , ( 8, Strawberries )
    , ( 16, Tomatoes )
    , ( 32, Chocolate )
    , ( 64, Pollen )
    , ( 128, Cats )
    ]


allergyToMask : Allergy -> Int
allergyToMask allergy =
    allergies
        |> List.filter (\( _, a ) -> a == allergy)
        |> List.foldl (\( x, _ ) _ -> x) 0


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    and (allergyToMask allergy) score /= 0


toList : Int -> List Allergy
toList score =
    allergies
        |> List.filter (\( _, allergy ) -> isAllergicTo allergy score)
        |> List.map Tuple.second
