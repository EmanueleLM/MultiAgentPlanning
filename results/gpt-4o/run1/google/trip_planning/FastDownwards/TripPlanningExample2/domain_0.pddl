(define (domain european_trip)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)
    (:predicates
        (at ?city - city ?day - day)
        (visited ?city - city)
        (next_day ?d1 - day ?d2 - day)
        (flight_available ?from - city ?to - city)
        (wedding_attended)
    )

    (:action fly
        :parameters (?from - city ?to - city ?day_from - day ?day_to - day)
        :precondition (and
            (at ?from ?day_from)
            (flight_available ?from ?to)
            (next_day ?day_from ?day_to)
        )
        :effect (and
            (not (at ?from ?day_from))
            (at ?to ?day_to)
        )
    )

    (:action stay
        :parameters (?city - city ?day_from - day ?day_to - day)
        :precondition (and
            (at ?city ?day_from)
            (next_day ?day_from ?day_to)
        )
        :effect (and
            (not (at ?city ?day_from))
            (at ?city ?day_to)
            (when (and (at venice ?day_to) 
                       (or (and (next_day day_7 ?day_to) (next_day day_8 ?day_to))
                           (and (next_day day_8 ?day_to) (next_day day_9 ?day_to))
                           (and (next_day day_9 ?day_to) (next_day day_10 ?day_to))))
                  (wedding_attended))
        )
    )

    (:action mark_visited
        :parameters (?city - city)
        :precondition (and
            (or (and (= ?city reykjavik) (at reykjavik day_2))
                (and (= ?city vienna) (at vienna day_7))
                (and (= ?city venice) (at venice day_11))
            )
        )
        :effect (visited ?city)
    )
)