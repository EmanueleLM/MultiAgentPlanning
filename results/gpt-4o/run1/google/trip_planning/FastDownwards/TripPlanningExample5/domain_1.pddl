(define (domain european_trip)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)
    (:predicates
        (in_city ?c - city ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (flight_available ?from - city ?to - city)
        (conference_day ?d - day)
    )
    (:action fly
        :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
        :precondition (and
            (in_city ?from ?d1)
            (next_day ?d1 ?d2)
            (flight_available ?from ?to)
        )
        :effect (and
            (not (in_city ?from ?d2))
            (in_city ?to ?d2)
        )
    )
    (:action stay
        :parameters (?c - city ?d1 - day ?d2 - day)
        :precondition (and
            (in_city ?c ?d1)
            (next_day ?d1 ?d2)
        )
        :effect (and
            (not (in_city ?c ?d1))
            (in_city ?c ?d2)
        )
    )
)