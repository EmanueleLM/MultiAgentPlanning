(define (domain travel_plan)
    (:requirements :strips :typing :negative-preconditions)

    (:types city day)

    (:predicates
        (at ?c - city ?d - day)
        (visited ?c - city)
        (next ?d1 - day ?d2 - day)
        (can_fly ?from ?to - city)
        (meeting_day ?d - day)
    )

    (:action fly
        :parameters (?from ?to - city ?day1 ?day2 - day)
        :precondition (and
            (at ?from ?day1)
            (next ?day1 ?day2)
            (can_fly ?from ?to)
        )
        :effect (and
            (not (at ?from ?day1))
            (at ?to ?day2)
            (visited ?to)
        )
    )

    (:action stay
        :parameters (?c - city ?day1 ?day2 - day)
        :precondition (and
            (at ?c ?day1)
            (next ?day1 ?day2)
        )
        :effect (at ?c ?day2)
    )
)