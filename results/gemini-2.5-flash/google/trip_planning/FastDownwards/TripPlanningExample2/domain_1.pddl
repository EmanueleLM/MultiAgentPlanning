(define (domain trip_planning_example2)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (has_flight ?from - city ?to - city)
        (visited_city_on_day ?c - city ?d - day)
    )

    (:action spend_day
        :parameters (?c - city ?d_current - day ?d_next - day)
        :precondition (and
            (at ?c)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (visited_city_on_day ?c ?d_current)
        )
    )

    (:action travel_day
        :parameters (?from - city ?to - city ?d_current - day ?d_next - day)
        :precondition (and
            (at ?from)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
            (has_flight ?from ?to)
            (not (at ?to)) ; Cannot travel to a city you are already in
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?d_current))
            (current_day ?d_next)
            ; No visited_city_on_day for travel day, as it's spent commuting
        )
    )
)