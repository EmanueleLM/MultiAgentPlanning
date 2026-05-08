(define (domain travel_plan)

    (:requirements :strips :typing :negative-preconditions)

    (:types city day)

    (:predicates
        (at ?c - city ?d - day)
        (visited ?c - city)
        (next ?d1 - day ?d2 - day)
        (meeting_day ?d - day)
    )

    (:action fly
        :parameters (?from ?to - city ?day1 ?day2 - day)
        :precondition (and
            (at ?from ?day1)
            (next ?day1 ?day2)
            (or
                (and (or (and (= ?from porto) (= ?to berlin))
                         (and (= ?from berlin) (= ?to porto)))
                     (or (= ?day1 day_1) (= ?day1 day_8) (= ?day1 day_15)))
                (and (= ?from berlin) (= ?to reykjavik) (= ?day1 day_12))
            )
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