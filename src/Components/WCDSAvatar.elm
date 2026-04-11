module Components.WCDSAvatar exposing
    ( view
    , Size(..), Variant(..)
    , src, alt, name, variant, size
    )

{-| Type-safe Elm wrapper for the `<wcds-avatar>` web component.

@docs view
@docs Size, Variant
@docs src, alt, name, variant, size

-}

import Html exposing (Attribute, Html, node)
import Html.Attributes exposing (attribute)



-- TYPES


{-| Avatar size.
-}
type Size
    = Sm
    | Md
    | Lg


{-| Avatar shape variant.
-}
type Variant
    = Circular
    | Rounded
    | Square



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


variantToString : Variant -> String
variantToString v =
    case v of
        Circular ->
            "circular"

        Rounded ->
            "rounded"

        Square ->
            "square"



-- ATTRIBUTES


{-| Set the image source URL.
-}
src : String -> Attribute msg
src  =
    attribute "src"


{-| Set the alt text.
-}
alt : String -> Attribute msg
alt =
    attribute "alt"


{-| Set the person's name (used for initials fallback).
-}
name : String -> Attribute msg
name =
    attribute "name"


{-| Set the avatar variant (`circular`, `rounded`, `square`). Default: `Circular`.
-}
variant : Variant -> Attribute msg
variant =
    variantToString >> attribute "variant"


{-| Set the avatar size (`sm`, `md`, `lg`). Default: `Md`.
-}
size : Size -> Attribute msg
size =
    sizeToString >> attribute "size"


-- VIEW


{-| Render a `<wcds-avatar>` element.

    WCDSAvatar.view
        [ WCDSAvatar.src "https://example.com/photo.jpg"
        , WCDSAvatar.name "Jane Doe"
        , WCDSAvatar.size WCDSAvatar.Sm
        ]
        []

-}
view : List (Attribute msg) -> List (Html msg) -> Html msg
view  =
    node "wcds-avatar"
