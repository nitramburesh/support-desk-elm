module Components.WCDSBadge exposing
    ( view
    , Variant(..)
    , variant
    )

{-| Type-safe Elm wrapper for the `<wcds-badge>` web component.

@docs view
@docs Variant
@docs variant

-}

import Html exposing (Attribute, Html, node)
import Html.Attributes exposing (attribute)



-- TYPES


{-| Badge variant.
-}
type Variant
    = Info
    | Success
    | Warning
    | Error



-- INTERNAL CONVERTERS


variantToString : Variant -> String
variantToString v =
    case v of
        Info ->
            "info"

        Success ->
            "success"

        Warning ->
            "warning"

        Error ->
            "error"



-- ATTRIBUTES


{-| Set the badge variant (`info`, `success`, `warning`, `error`). Default: `Info`.
-}
variant : Variant -> Attribute msg
variant =
    variantToString >> attribute "variant"



-- VIEW


{-| Render a `<wcds-badge>` element.

    WCDSBadge.view
        [ WCDSBadge.variant WCDSBadge.Success ]
        [ Html.text "RESOLVED" ]

-}
view : List (Attribute msg) -> List (Html msg) -> Html msg
view  =
    node "wcds-badge"
