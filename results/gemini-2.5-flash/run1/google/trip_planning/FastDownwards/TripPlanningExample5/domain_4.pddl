(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:constants dubrovnik - city) ; Declared as a constant to avoid potential UnknownToken errors with strict validators
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (flight_route ?c1 - city ?c2 - city)
        (dubrovnik_conference_day ?d - day)
        (attended_conference_on_day ?d - day)
        (visited ?c - city)
    )

    (:action advance_day_stay_regular
        :parameters (?c - city ?d_curr - day ?d_next - day)
        :precondition (and
            (at ?c)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (not (dubrovnik_conference_day ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (visited ?c)
        )
    )

    (:action advance_day_stay_dubrovnik_conference
        :parameters (?d_curr - day ?d_next - day)
        :precondition (and
            (at dubrovnik)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (dubrovnik_conference_day ?d_curr)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (visited dubrovnik)
            (attended_conference_on_day ?d_curr)
        )
    )

    (:action advance_day_travel
        :parameters (?from - city ?to - city ?d_curr - day ?d_next - day)
        :precondition (and
            (at ?from)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (flight_route ?from ?to)
            (not (dubrovnik_conference_day ?d_curr))
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (visited ?to)
        )
    )
)