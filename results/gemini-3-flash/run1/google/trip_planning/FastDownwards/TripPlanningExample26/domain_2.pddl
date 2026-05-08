(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city ?d - day)
        (spent ?c - city ?d - day)
        (next ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (is_meeting_city ?c - city)
        (is_meeting_window ?d - day)
        (friend_met)
    )

    ;; Advance to the next day while staying in the same city.
    (:action stay
        :parameters (?c - city ?d1 - day ?d2 - day)
        :precondition (and (at ?c ?d1) (next ?d1 ?d2))
        :effect (and (at ?c ?d2) (not (at ?c ?d1)))
    )

    ;; Fly between two connected cities on the same day.
    ;; This allows for sharing a travel day between two cities.
    (:action fly
        :parameters (?from - city ?to - city ?d - day)
        :precondition (and (at ?from ?d) (connected ?from ?to))
        :effect (and (at ?to ?d) (not (at ?from ?d)))
    )

    ;; Mark a day as spent in a specific city.
    (:action mark_spent
        :parameters (?c - city ?d - day)
        :precondition (at ?c ?d)
        :effect (spent ?c ?d)
    )

    ;; Meet the friend in a specific city within the specified window.
    (:action meet_friend
        :parameters (?c - city ?d - day)
        :precondition (and (at ?c ?d) (is_meeting_city ?c) (is_meeting_window ?d))
        :effect (friend_met)
    )
)