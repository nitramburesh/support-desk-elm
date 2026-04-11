module Components.WCDSButton exposing
    ( view
    , Size(..), ButtonVariant(..), ColorScheme(..), ButtonType(..), Icon(..)
    , size, variant, colorScheme, buttonType, iconLeft, iconRight, disabled, onClick
    )

{-| Type-safe Elm wrapper for the `<wcds-button>` web component.

@docs view
@docs Size, ButtonVariant, ColorScheme, ButtonType, Icon
@docs size, variant, colorScheme, buttonType, iconLeft, iconRight, disabled, onClick

-}

import Html exposing (Attribute, Html, node)
import Html.Attributes exposing (attribute)
import Html.Events
import Json.Decode as Decode
import Json.Encode as Encode



-- TYPES


{-| Button size.
-}
type Size
    = Sm
    | Md
    | Lg


{-| Button visual variant.
-}
type ButtonVariant
    = Solid
    | Outlined
    | Ghost


{-| Button color scheme.
-}
type ColorScheme
    = Primary
    | Secondary
    | Neutral


{-| Button HTML type.
-}
type ButtonType
    = Button
    | Submit
    | Reset


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


variantToString : ButtonVariant -> String
variantToString v =
    case v of
        Solid ->
            "solid"

        Outlined ->
            "outlined"

        Ghost ->
            "ghost"


colorSchemeToString : ColorScheme -> String
colorSchemeToString cs =
    case cs of
        Primary ->
            "primary"

        Secondary ->
            "secondary"

        Neutral ->
            "neutral"


buttonTypeToString : ButtonType -> String
buttonTypeToString bt =
    case bt of
        Button ->
            "button"

        Submit ->
            "submit"

        Reset ->
            "reset"


iconToString : Icon -> String
iconToString icon =
    case icon of
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


{-| Set the button size (`sm`, `md`, `lg`). Default: `Md`.
-}
size : Size -> Attribute msg
size =
    sizeToString >> attribute "size"


{-| Set the button variant (`solid`, `outlined`, `ghost`). Default: `Solid`.
-}
variant : ButtonVariant -> Attribute msg
variant =
    variantToString >> attribute "variant"


{-| Set the color scheme (`primary`, `secondary`, `neutral`). Default: `Primary`.
-}
colorScheme : ColorScheme -> Attribute msg
colorScheme =
    colorSchemeToString >> attribute "colorScheme"


{-| Set the button type (`button`, `submit`, `reset`). Default: `Button`.
-}
buttonType : ButtonType -> Attribute msg
buttonType =
    buttonTypeToString >> attribute "type"


{-| Set the left icon.
-}
iconLeft : Icon -> Attribute msg
iconLeft =
    iconToString >> attribute "iconLeft"


{-| Set the right icon.
-}
iconRight : Icon -> Attribute msg
iconRight =
    iconToString >> attribute "iconRight"


{-| Set the disabled state.
-}
disabled : Bool -> Attribute msg
disabled =
    Encode.bool >> Html.Attributes.property "disabled"


{-| Handle the button click event.
-}
onClick : msg -> Attribute msg
onClick =
    Decode.succeed >> Html.Events.on "click"



-- VIEW


{-| Render a `<wcds-button>` element.

    WCDSButton.view
        [ WCDSButton.variant Solid
        , WCDSButton.colorScheme Primary
        , WCDSButton.size Md
        , WCDSButton.onClick ClickedSubmit
        ]
        [ Html.text "Submit" ]

-}
view : List (Attribute msg) -> List (Html msg) -> Html msg
view  =
    node "wcds-button"