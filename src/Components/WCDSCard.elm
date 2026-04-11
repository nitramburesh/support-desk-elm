module Components.WCDSCard exposing
    ( view
    , header, footer
    )

{-| Type-safe Elm wrapper for the `<wcds-card>` web component.

@docs view
@docs header, footer

-}

import Html exposing (Attribute, Html, div, node)
import Html.Attributes exposing (attribute)



-- SLOT HELPERS


{-| Wrap content in a `header` slot.

    WCDSCard.header [ Html.text "Title" ]

-}
header : List (Html msg) -> Html msg
header children =
    div [ attribute "slot" "header" ] children


{-| Wrap content in a `footer` slot.

    WCDSCard.footer [ Html.text "Actions" ]

-}
footer : List (Html msg) -> Html msg
footer  =
    div [ attribute "slot" "footer" ] 



-- VIEW


{-| Render a `<wcds-card>` element.

    WCDSCard.view []
        [ WCDSCard.header [ Html.text "Title" ]
        , Html.p [] [ Html.text "Body content" ]
        , WCDSCard.footer [ Html.text "Footer" ]
        ]

-}
view : List (Attribute msg) -> List (Html msg) -> Html msg
view  =
    node "wcds-card" 
