(define (domain trip_planning_repaired)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        num_days ; For tracking days spent in a city
    )
    (:predicates
        (at ?c - city)
        (connected ?c1 ?c2 - city)
        (on_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (has_visited ?c - city)
        (valencia_occupied_on_day ?d - day) ; Marks days 5-9 as mandatory for Valencia
        (day_is_spent ?d - day) ; Tracks if a day has been spent
        (days_spent_in ?c - city ?n - num_days) ; Tracks specific day count for each city
        (next_num ?n1 ?n2 - num_days) ; For incrementing day counts
    )

    (:action travel
        :parameters (?from - city ?to - city ?current_d - day)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (on_day ?current_d)
            (not (day_is_spent ?current_d)) ; Travel happens during a day, before it's "spent"
            (not (valencia_occupied_on_day ?current_d)) ; Cannot travel during Valencia's fixed stay period (days 5-9)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (has_visited ?to)
        )
    )

    (:action spend_day_in_general_city
        :parameters (?c - city ?d_current - day ?d_next - day ?n_current - num_days ?n_next - num_days)
        :precondition (and
            (at ?c)
            (on_day ?d_current)
            (next_day ?d_current ?d_next)
            (not (day_is_spent ?d_current))
            ; This action is for days *not* exclusively for Valencia (i.e., days 1-4)
            (not (valencia_occupied_on_day ?d_current))
            (days_spent_in ?c ?n_current)
            (next_num ?n_current ?n_next)
        )
        :effect (and
            (not (on_day ?d_current))
            (on_day ?d_next)
            (day_is_spent ?d_current)
            (has_visited ?c)
            (not (days_spent_in ?c ?n_current))
            (days_spent_in ?c ?n_next)
        )
    )

    (:action spend_day_in_valencia_fixed_period
        :parameters (?v - city ?d_current - day ?d_next - day ?n_current - num_days ?n_next - num_days)
        :precondition (and
            (= ?v valencia) ; Explicitly bind ?v to the valencia object for parser robustness
            (at ?v)
            (on_day ?d_current)
            (next_day ?d_current ?d_next)
            (not (day_is_spent ?d_current))
            ; This action is specifically for days marked for Valencia (days 5-9)
            (valencia_occupied_on_day ?d_current)
            (days_spent_in ?v ?n_current)
            (next_num ?n_current ?n_next)
        )
        :effect (and
            (not (on_day ?d_current))
            (on_day ?d_next)
            (day_is_spent ?d_current)
            (has_visited ?v)
            (not (days_spent_in ?v ?n_current))
            (days_spent_in ?v ?n_next)
        )
    )
)