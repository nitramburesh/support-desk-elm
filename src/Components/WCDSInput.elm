module Components.WCDSInput exposing
    ( view
    , Size(..), Icon(..)
    , size, label, placeholder, icon, disabled, error
    , onInput, onChange
    )

{-| Type-safe Elm wrapper for the `<wcds-input>` web component.

@docs view
@docs Size, Icon
@docs size, label, placeholder, icon, disabled, error
@docs onInput, onChange

-}

import Html exposing (Attribute, Html, node)
import Html.Attributes exposing (attribute)
import Html.Events
import Json.Decode as Decode
import Json.Encode as Encode



-- TYPES


{-| Input size.
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


{-| Set the input size (`sm`, `md`, `lg`). Default: `Md`.
-}
size : Size -> Attribute msg
size  =
    sizeToString >> attribute "size" 


{-| Set the label text.
-}
label : String -> Attribute msg
label =
    attribute "label" 


{-| Set the placeholder text.
-}
placeholder : String -> Attribute msg
placeholder =
    attribute "placeholder" 


{-| Set the icon.
-}
icon : Icon -> Attribute msg
icon =
    iconToString >> attribute "icon" 


{-| Set the disabled state.
-}
disabled : Bool -> Attribute msg
disabled =
    Encode.bool >> Html.Attributes.property "disabled"


{-| Set the error message.
-}
error : String -> Attribute msg
error =
    attribute "error" 


{-| Handle the input event (fires on each keystroke).
-}
onInput : (String -> msg) -> Attribute msg
onInput toMsg =
    Html.Events.on "input"
        (Decode.at [ "detail", "value" ] Decode.string
            |> Decode.map toMsg
        )


{-| Handle the change event (fires on blur).
-}
onChange : (String -> msg) -> Attribute msg
onChange toMsg =
    Html.Events.on "change"
        (Decode.at [ "detail", "value" ] Decode.string
            |> Decode.map toMsg
        )



-- VIEW


{-| Render a `<wcds-input>` element.

    WCDSInput.view
        [ WCDSInput.placeholder "Search..."
        , WCDSInput.icon WCDSInput.Search
        , WCDSInput.onInput SearchChanged
        ]

-}
view : List (Attribute msg) -> Html msg
view attrs =
    node "wcds-input" attrs []
