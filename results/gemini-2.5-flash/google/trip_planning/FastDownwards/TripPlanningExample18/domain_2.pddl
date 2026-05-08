(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (connected ?c1 - city ?c2 - city)
        (friend-met)
    )
    (:functions
        (current-day)
    )

    (:action fly
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (< (current-day) 11) ; Can fly on any day from 1 to 10. Action completes on the next day.
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            (increase (current-day) 1)
        )
    )

    (:action stay-amsterdam
        :parameters ()
        :precondition (and
            (at amsterdam)
            (< (current-day) 11) ; Can stay on any day from 1 to 10. Action completes on the next day.
        )
        :effect (and
            (increase (current-day) 1)
        )
    )

    (:action stay-vilnius
        :parameters ()
        :precondition (and
            (at vilnius)
            (< (current-day) 11) ; Can stay on any day from 1 to 10. Action completes on the next day.
        )
        :effect (and
            (increase (current-day) 1)
        )
    )

    (:action stay-bucharest
        :parameters ()
        :precondition (and
            (at bucharest)
            (< (current-day) 11) ; Can stay on any day from 1 to 10. Action completes on the next day.
        )
        :effect (and
            (increase (current-day) 1)
        )
    )

    (:action meet-friend-bucharest
        :parameters ()
        :precondition (and
            (at bucharest)
            (not (friend-met))
            (>= (current-day) 6)
            (<= (current-day) 11) ; Meeting can happen on Day 6 through Day 11.
        )
        :effect (and
            (friend-met)
        )
    )