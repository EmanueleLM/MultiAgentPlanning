(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types
        city day count
    )
    (:predicates
        (at_city ?c - city)
        (day_now ?d - day)
        (stay_count ?c - city ?n - count)
        (visited ?c - city ?d - day)
        (next_day ?d1 ?d2 - day)
        (next_count ?n1 ?n2 - count)
        (connected ?c1 ?c2 - city)
    )

    (:action stay_day
        :parameters (?city - city ?d_now - day ?d_next - day ?c_old - count ?c_new - count)
        :precondition (and 
            (at_city ?city)
            (day_now ?d_now)
            (next_day ?d_now ?d_next)
            (stay_count ?city ?c_old)
            (next_count ?c_old ?c_new)
        )
        :effect (and 
            (not (day_now ?d_now))
            (day_now ?d_next)
            (not (stay_count ?city ?c_old))
            (stay_count ?city ?c_new)
            (visited ?city ?d_now)
        )
    )

    (:action fly_day
        :parameters (?from - city ?to - city ?d_now - day ?d_next - day ?cf_old - count ?cf_new - count ?ct_old - count ?ct_new - count)
        :precondition (and 
            (at_city ?from)
            (day_now ?d_now)
            (next_day ?d_now ?d_next)
            (connected ?from ?to)
            (stay_count ?from ?cf_old)
            (next_count ?cf_old ?cf_new)
            (stay_count ?to ?ct_old)
            (next_count ?ct_old ?ct_new)
        )
        :effect (and 
            (not (at_city ?from))
            (at_city ?to)
            (not (day_now ?d_now))
            (day_now ?d_next)
            (not (stay_count ?from ?cf_old))
            (stay_count ?from ?cf_new)
            (not (stay_count ?to ?ct_old))
            (stay_count ?to ?ct_new)
            (visited ?from ?d_now)
            (visited ?to ?d_now)
        )
    )
)