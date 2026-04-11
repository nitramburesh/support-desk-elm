module Main exposing (..)

import Browser
import Html exposing (Html, a, div, h1, h2, h3, p, span, strong, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)

import Components.WCDSAvatar as WCDSAvatar
import Components.WCDSBadge as WCDSBadge
import Components.WCDSButton as WCDSButton
import Components.WCDSCard as WCDSCard
import Components.WCDSIcon as WCDSIcon
import Components.WCDSInput as WCDSInput

---- MODEL ----


type alias Ticket =
    { name : String
    , avatar : String
    , message : String
    , time : String
    , status : TicketStatus
    }


type TicketStatus
    = WaitingForAgent
    | Resolved


type NavItem
    = Home
    | Inbox
    | Profile


type alias Model =
    { searchQuery : String
    , activeNav : NavItem
    , tickets : List Ticket
    }


init : ( Model, Cmd Msg )
init =
    ( { searchQuery = ""
      , activeNav = Home
      , tickets =
            [ { name = "Marcus Jenkins"
              , avatar = "https://i.pravatar.cc/100?img=11"
              , message = "Hi, I'm having trouble with the billing..."
              , time = "12m ago"
              , status = WaitingForAgent
              }
            , { name = "Elena Rossi"
              , avatar = "https://i.pravatar.cc/100?img=5"
              , message = "Thank you for the quick resolution!"
              , time = "2h ago"
              , status = Resolved
              }
            , { name = "Julian Smith"
              , avatar = "https://i.pravatar.cc/100?img=12"
              , message = "Can I upgrade my plan mid-month?"
              , time = "Yesterday"
              , status = Resolved
              }
            ]
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp
    | SetNavItem NavItem
    | SearchInput String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        SetNavItem item ->
            ( { model | activeNav = item }, Cmd.none )

        SearchInput query ->
            ( { model | searchQuery = query }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "app" ]
        [ viewTopHeader
        , viewMainContent model
        , viewBottomNav model.activeNav
        ]


viewTopHeader : Html Msg
viewTopHeader =
    div [ class "top-header" ]
        [ h1 [] [ text "Ticket Dashboard" ]
        , WCDSButton.view
            [ WCDSButton.variant WCDSButton.Ghost , WCDSButton.iconLeft WCDSButton.Menu ]
            []

        ]


viewMainContent : Model -> Html Msg
viewMainContent model =
    div [ class "main-content" ]
        [ viewSupportHeader
        , viewSearchSection
        , viewActionCards
        , viewRecentActivity model.tickets
        ]


viewSupportHeader : Html Msg
viewSupportHeader =
    div [ class "support-header" ]
        [ h2 [] [ text "Support Center" ]
        , WCDSAvatar.view
            [ WCDSAvatar.src "https://i.pravatar.cc/100?img=9"
            , WCDSAvatar.name "User"
            , WCDSAvatar.size WCDSAvatar.Sm
            ]
            []
        ]


viewSearchSection : Html Msg
viewSearchSection =
    div [ class "search-section" ]
        [ WCDSInput.view
            [ WCDSInput.placeholder "Search help articles or tickets"
            , WCDSInput.icon WCDSInput.Search
            ]
        ]


viewActionCards : Html Msg
viewActionCards =
    div [ class "action-cards" ]
        [ viewActionCard "blue" WCDSIcon.Check "Open New Ticket"
        , viewActionCard "gray" WCDSIcon.Menu "My Conversations"
        , viewActionCard "orange" WCDSIcon.Search "Knowledge Base"
        ]


viewActionCard : String -> WCDSIcon.Icon -> String -> Html Msg
viewActionCard colorClass iconValue label =
    div [ class "action-card" ]
        [ div [ class ("action-card-icon " ++ colorClass) ]
            [ WCDSIcon.view [ WCDSIcon.icon iconValue ] ]
        , span [ class "action-card-label" ] [ text label ]
        ]


viewRecentActivity : List Ticket -> Html Msg
viewRecentActivity tickets =
    div [ class "recent-activity" ]
        [ div [ class "section-header" ]
            [ h3 [] [ text "Recent Activity" ]
            , a [ href "#" ] [ text "View All" ]
            ]
        , div [ class "activity-list" ]
            (List.map viewActivityCard tickets)
        ]


viewActivityCard : Ticket -> Html Msg
viewActivityCard ticket =
    WCDSCard.view []
        [ WCDSCard.header
            [ WCDSAvatar.view
                [ WCDSAvatar.src ticket.avatar
                , WCDSAvatar.name ticket.name
                , WCDSAvatar.size WCDSAvatar.Sm
                ]
                []
            ]
        , div [ class "activity-content" ]
            [ strong [] [ text ticket.name ]
            , p [ class "activity-message" ] [ text ticket.message ]
            , viewStatus ticket.status
            ]
        , WCDSCard.footer
            [ span [ class "activity-time" ] [ text ticket.time ] ]
        ]


viewStatus : TicketStatus -> Html Msg
viewStatus status =
    case status of
        WaitingForAgent ->
            WCDSBadge.view [ WCDSBadge.variant WCDSBadge.Warning ] [ text "WAITING FOR AGENT" ]

        Resolved ->
            WCDSBadge.view [ WCDSBadge.variant WCDSBadge.Success ] [ text "RESOLVED" ]


viewBottomNav : NavItem -> Html Msg
viewBottomNav activeNav =
    div [ class "bottom-nav" ]
        [ viewNavItem Home WCDSIcon.Search "Home" (activeNav == Home)
        , viewNavItem Inbox WCDSIcon.Menu "Inbox" (activeNav == Inbox)
        , viewNavItem Profile WCDSIcon.Check "Profile" (activeNav == Profile)
        ]


viewNavItem : NavItem -> WCDSIcon.Icon -> String -> Bool -> Html Msg
viewNavItem navItem iconValue label isActive =
    div
        [ class
            (if isActive then
                "nav-item active"

             else
                "nav-item"
            )
        , onClick (SetNavItem navItem)
        ]
        [ WCDSIcon.view [ WCDSIcon.icon iconValue ]
        , span [] [ text label ]
        ]







---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
