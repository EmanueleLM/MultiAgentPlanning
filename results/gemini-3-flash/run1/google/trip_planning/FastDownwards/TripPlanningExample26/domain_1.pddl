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
            (between_12_16 ?d - day)
            (friend_met)
        )

        ;; Move forward to the next day while staying in the same city.
        (:action stay
            :parameters (?c - city ?d1 - day ?d2 - day)
            :precondition (and (at ?c ?d1) (next ?d1 ?d2))
            :effect (at ?c ?d2)
        )

        ;; Take a direct flight between two cities on a specific day.
        ;; This allows the traveler to be in two cities on the same calendar day (the travel day).
        (:action fly
            :parameters (?from - city ?to - city ?d - day)
            :precondition (and (at ?from ?d) (connected ?from ?to))
            :effect (and (at ?to ?d) (not (at ?from ?d)))
        )

        ;; Explicitly mark a day as spent in a city.
        (:action mark_spent
            :parameters (?c - city ?d - day)
            :precondition (at ?c ?d)
            :effect (spent ?c ?d)
        )

        ;; Meet the friend in Reykjavik during the specified window.
        (:action meet_friend
            :parameters (?d - day)
            :precondition (and (at reykjavik ?d) (between_12_16 ?d))
            :effect (friend_met)
        )
    )