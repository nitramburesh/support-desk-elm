module Components.WCDSIcon exposing
    ( view
    , Size(..), Icon(..)
    , size, icon
    )

{-| Type-safe Elm wrapper for the `<wcds-icon>` web component.

@docs view
@docs Size, Icon
@docs size, icon

-}

import Html exposing (Attribute, Html, node)
import Html.Attributes exposing (attribute)



-- TYPES


{-| Icon size.
-}
type Size
    = Sm
    | Md
    | Lg


{-| Available icon names.
-}
type Icon
    = ArrowLeft
    | ArrowRight
    | Check
    | Close
    | Menu
    | Search
    | Location



-- INTERNAL CONVERTERS


sizeToString : Size -> String
sizeToString s =
    case s of
        Sm ->
            "sm"

        Md ->
            "md"

        Lg ->
            "lg"


iconToString : Icon -> String
iconToString i =
    case i of
        ArrowLeft ->
            "arrow-left"

        ArrowRight ->
            "arrow-right"

        Check ->
            "check"

        Close ->
            "close"

        Menu ->
            "menu"

        Search ->
            "search"

        Location ->
            "location"



-- ATTRIBUTES


{-| Set the icon size (`sm`, `md`, `lg`). Default: `Md`.
-}
size : Size -> Attribute msg
size =
    sizeToString >> attribute "size"


{-| Set the icon name.
-}
icon : Icon -> Attribute msg
icon =
    iconToString >> attribute "icon"



-- VIEW


{-| Render a `<wcds-icon>` element.

    WCDSIcon.view
        [ WCDSIcon.icon WCDSIcon.Search
        , WCDSIcon.size WCDSIcon.Md
        ]

-}
view : List (Attribute msg) -> Html msg
view attrs =
    node "wcds-icon" attrs []
