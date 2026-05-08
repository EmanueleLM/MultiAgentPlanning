(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        num
    )
    (:predicates
        (current_location ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (has_flight ?from - city ?to - city)
        (visited_on_day ?c - city ?d - day) ; Tracks explicit day visits for fixed constraints (e.g., workshop)
        (days_in_city ?c - city ?n - num) ; Tracks cumulative days spent in a city
        (next_num ?n1 - num ?n2 - num) ; For incrementing day counts
    )

    (:action stay_in_city
        :parameters (?c - city ?d - day ?next_d - day ?n - num ?next_n - num)
        :precondition (and
            (current_location ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
            (days_in_city ?c ?n)
            (next_num ?n ?next_n)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (visited_on_day ?c ?d) ; Day ?d is spent here
            (not (days_in_city ?c ?n))
            (days_in_city ?c ?next_n)
        )
    )

    (:action travel_to_city
        :parameters (?from - city ?to - city ?d - day ?next_d - day)
        :precondition (and
            (current_location ?from)
            (has_flight ?from ?to)
            (current_day ?d)
            (next_day ?d ?next_d)
        )
        :effect (and
            (not (current_location ?from))
            (current_location ?to)
            (not (current_day ?d))
            (current_day ?next_d)
            ; Day ?d is spent traveling, not visiting a city, so visited_on_day is not asserted.
            ; No change to days_in_city as travel days don't count towards stay durations.
        )
    )
)