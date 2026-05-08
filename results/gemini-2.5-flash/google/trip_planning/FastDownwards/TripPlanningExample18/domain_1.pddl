(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs :preferences)
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
        (days-spent-amsterdam)
        (days-spent-vilnius)
        (days-spent-bucharest)
        (total-cost)
    )

    (:action fly
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (< (current-day) 11) ; Cannot fly if it makes current-day exceed 11
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            (increase (current-day) 1)
            (increase (total-cost) 1)
        )
    )

    (:action stay-amsterdam
        :parameters ()
        :precondition (and
            (at amsterdam)
            (< (current-day) 11) ; Cannot stay if it makes current-day exceed 11
        )
        :effect (and
            (increase (current-day) 1)
            (increase (days-spent-amsterdam) 1)
            (increase (total-cost) 1)
        )
    )

    (:action stay-vilnius
        :parameters ()
        :precondition (and
            (at vilnius)
            (< (current-day) 11) ; Cannot stay if it makes current-day exceed 11
        )
        :effect (and
            (increase (current-day) 1)
            (increase (days-spent-vilnius) 1)
            (increase (total-cost) 1)
        )
    )

    (:action stay-bucharest
        :parameters ()
        :precondition (and
            (at bucharest)
            (< (current-day) 11) ; Cannot stay if it makes current-day exceed 11
        )
        :effect (and
            (increase (current-day) 1)
            (increase (days-spent-bucharest) 1)
            (increase (total-cost) 1)
        )
    )

    (:action meet-friend-bucharest
        :parameters ()
        :precondition (and
            (at bucharest)
            (not (friend-met))
            (>= (current-day) 6)
            (<= (current-day) 11) ; Meeting can happen on day 11 itself
        )
        :effect (and
            (friend-met)
            (increase (total-cost) 0) ; This action does not consume a day or incur extra cost
        )
    )
)