(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        stay_count_num
    )

    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (direct_flight ?c1 - city ?c2 - city)
        (stayed_on_day ?c - city ?d - day)
        (city_stays ?c - city ?s - stay_count_num) ; Generalized predicate for stay counts
        (next_stay_count ?s1 - stay_count_num ?s2 - stay_count_num)
    )

    (:action fly
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (direct_flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    (:action spend_day
        :parameters (?c - city ?d - day ?next_d - day ?prev_s - stay_count_num ?next_s - stay_count_num)
        :precondition (and
            (at ?c)
            (current_day ?d)
            (next_day ?d ?next_d)
            (city_stays ?c ?prev_s) ; Check city-specific stay count
            (next_stay_count ?prev_s ?next_s)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?next_d)
            (stayed_on_day ?c ?d)
            (not (city_stays ?c ?prev_s))
            (city_stays ?c ?next_s) ; Increment city-specific stay count
        )
    )

    (:action finish_trip
        :parameters (?d - day)
        :precondition (and
            (current_day ?d)
            (next_day ?d day_end)
        )
        :effect (and
            (not (current_day ?d))
            (current_day day_end)
        )
    )
)