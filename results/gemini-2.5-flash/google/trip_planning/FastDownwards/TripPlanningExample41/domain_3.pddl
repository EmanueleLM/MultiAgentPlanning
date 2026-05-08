(define (domain trip_planning_example41)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at_city ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (direct_flight ?c1 - city ?c2 - city)
        (conference_on_day ?d - day)
        (conference_city ?d - day ?c - city)
        (spent_day_in ?c - city ?d - day)
    )

    (:action stay_in_city
        :parameters (?c - city ?d - day ?next_d - day)
        :precondition
            (and
                (current_day ?d)
                (at_city ?c)
                (next_day ?d ?next_d)
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (spent_day_in ?c ?d)
            )
    )

    (:action fly
        :parameters (?from_c - city ?to_c - city ?d - day ?next_d - day)
        :precondition
            (and
                (current_day ?d)
                (at_city ?from_c)
                (direct_flight ?from_c ?to_c)
                (next_day ?d ?next_d)
                (not (and (conference_on_day ?d) (conference_city ?d ?from_c)))
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (at_city ?from_c))
                (at_city ?to_c)
                (spent_day_in ?from_c ?d)
            )
    )
)