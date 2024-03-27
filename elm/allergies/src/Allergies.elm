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
    let
        extractMask : List ( Int, Allergy ) -> Int
        extractMask xs =
            case xs of
                [] ->
                    0

                x :: _ ->
                    Tuple.first x
    in
    allergies
        |> List.filter (\( _, a ) -> a == allergy)
        |> extractMask


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    and (allergyToMask allergy) score /= 0


toList : Int -> List Allergy
toList score =
    allergies
        |> List.filter (\( _, allergy ) -> isAllergicTo allergy score)
        |> List.map Tuple.second
