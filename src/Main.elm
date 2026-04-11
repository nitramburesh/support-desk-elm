module Main exposing (..)

import Browser
import Html exposing (Html, a, div, h1, h2, h3, node, p, span, strong, text)
import Html.Attributes exposing (attribute, class, href)
import Html.Events exposing (onClick)



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
        , node "wcds-button" [ attribute "variant" "ghost" ] [ wcdsIcon "menu" ]
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
        , wcdsAvatar "https://i.pravatar.cc/100?img=9" "User"
        ]


viewSearchSection : Html Msg
viewSearchSection =
    div [ class "search-section" ] [ wcdsInput "Search help articles or tickets" "search" ]


viewActionCards : Html Msg
viewActionCards =
    div [ class "action-cards" ]
        [ viewActionCard "blue" "check" "Open New Ticket"
        , viewActionCard "gray" "menu" "My Conversations"
        , viewActionCard "orange" "search" "Knowledge Base"
        ]


viewActionCard : String -> String -> String -> Html Msg
viewActionCard colorClass iconName label =
    div [ class "action-card" ]
        [ div [ class ("action-card-icon " ++ colorClass) ] [ wcdsIcon iconName ]
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
    wcdsCard
        [ div [ attribute "slot" "header" ] [ wcdsAvatar ticket.avatar ticket.name ]
        , div [ class "activity-content" ]
            [ strong [] [ text ticket.name ]
            , p [ class "activity-message" ] [ text ticket.message ]
            , viewStatus ticket.status
            ]
        , div [ attribute "slot" "footer" ]
            [ span [ class "activity-time" ] [ text ticket.time ]
            ]
        ]


viewStatus : TicketStatus -> Html Msg
viewStatus status =
    case status of
        WaitingForAgent ->
            wcdsBadge "warning" "WAITING FOR AGENT"

        Resolved ->
            wcdsBadge "success" "RESOLVED"


viewBottomNav : NavItem -> Html Msg
viewBottomNav activeNav =
    div [ class "bottom-nav" ]
        [ viewNavItem Home "search" "Home" (activeNav == Home)
        , viewNavItem Inbox "menu" "Inbox" (activeNav == Inbox)
        , viewNavItem Profile "check" "Profile" (activeNav == Profile)
        ]


viewNavItem : NavItem -> String -> String -> Bool -> Html Msg
viewNavItem navItem iconName label isActive =
    div
        [ class
            (if isActive then
                "nav-item active"

             else
                "nav-item"
            )
        , onClick (SetNavItem navItem)
        ]
        [ wcdsIcon iconName
        , span [] [ text label ]
        ]



---- WCDS COMPONENTS ----


wcdsButton : String -> String -> String -> Html Msg
wcdsButton variant colorScheme iconName =
    node "wcds-button"
        [ attribute "variant" variant
        , attribute "color-scheme" colorScheme
        ]
        [ wcdsIcon iconName ]


wcdsInput : String -> String -> Html Msg
wcdsInput placeholderText iconName =
    node "wcds-input"
        [ attribute "placeholder" placeholderText
        , attribute "icon" iconName
        ]
        []


wcdsIcon : String -> Html Msg
wcdsIcon iconName =
    node "wcds-icon"
        [ attribute "icon" iconName ]
        []


wcdsAvatar : String -> String -> Html Msg
wcdsAvatar src name =
    node "wcds-avatar"
        [ attribute "src" src
        , attribute "name" name
        , attribute "size" "sm"
        ]
        []


wcdsBadge : String -> String -> Html Msg
wcdsBadge variant label =
    node "wcds-badge"
        [ attribute "variant" variant
        , attribute "size" "sm"
        ]
        [ span [] [ text label ] ]


wcdsCard : List (Html Msg) -> Html Msg
wcdsCard =
    node "wcds-card" []



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
