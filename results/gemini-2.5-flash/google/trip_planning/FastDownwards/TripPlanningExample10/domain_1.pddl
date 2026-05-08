(define (domain trip_planning_repaired)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city)
        (connected ?c1 ?c2 - city)
        (on_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (has_visited ?c - city)
        (valencia_occupied_on_day ?d - day) ; Marks days 5-9 as mandatory for Valencia
        (day_is_spent ?d - day) ; Tracks if a day has been spent
    )

    (:action travel
        :parameters (?from - city ?to - city ?current_d - day)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (on_day ?current_d)
            ; Cannot travel if it's a day reserved for Valencia's fixed stay
            (not (valencia_occupied_on_day ?current_d))
            ; Cannot travel if the day is already spent (travel happens during a day, before it's "spent")
            (not (day_is_spent ?current_d))
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (has_visited ?to)
        )
    )

    (:action spend_day_pre_valencia_fixed_period
        :parameters (?c - city ?d_current - day ?d_next - day)
        :precondition (and
            (at ?c)
            (on_day ?d_current)
            (next_day ?d_current ?d_next)
            (or (at oslo) (at dublin)) ; Must be in Oslo or Dublin
            ; Must be a day NOT reserved for Valencia
            (not (valencia_occupied_on_day ?d_current))
            ; This day must not have been spent yet
            (not (day_is_spent ?d_current))
        )
        :effect (and
            (not (on_day ?d_current))
            (on_day ?d_next)
            (day_is_spent ?d_current)
            (has_visited ?c)
        )
    )

    (:action spend_day_in_valencia_fixed_period
        :parameters (?d_current - day ?d_next - day)
        :precondition (and
            (at valencia)
            (on_day ?d_current)
            (next_day ?d_current ?d_next)
            ; Must be a day reserved for Valencia
            (valencia_occupied_on_day ?d_current)
            ; This day must not have been spent yet
            (not (day_is_spent ?d_current))
        )
        :effect (and
            (not (on_day ?d_current))
            (on_day ?d_next)
            (day_is_spent ?d_current)
            (has_visited valencia)
        )
    )
)