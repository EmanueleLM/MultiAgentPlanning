(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (flight_route ?c1 - city ?c2 - city)
        (dubrovnik_conference ?d - day)
        (attended_conference_on_day ?d - day)
        (visited ?c - city)
    )

    (:action advance_day_stay_regular
        :parameters (?c - city ?d_curr - day ?d_next - day)
        :precondition (and
            (at ?c)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (not (dubrovnik_conference ?d_curr)) ; Cannot stay in a city (even Dubrovnik) if it's a conference day, unless using specific conference action
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
            (at dubrovnik) ; Must be in Dubrovnik to attend conference
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (dubrovnik_conference ?d_curr) ; Must be a conference day
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
            (not (dubrovnik_conference ?d_curr)) ; Cannot travel on a conference day
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