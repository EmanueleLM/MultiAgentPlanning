(define (domain TripPlanning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city)
    (:predicates
        (at ?c - city)
        (is-connected ?c1 - city ?c2 - city)
    )

    (:functions
        (current-day)
        (stay-A-remaining) ; Athens (7 days)
        (stay-Z-remaining) ; Zurich (5 days)
        (stay-K-remaining) ; Krakow (6 days)
        (total-cost) ; Tracks total days (stays + travel)
    )

    ; Action to spend a required day in Athens
    (:action stay-day-A
        :parameters ()
        :precondition (and 
            (at athens) 
            (>= (stay-A-remaining) 1)
            ; Athens D1-D7 constraint
            (<= (current-day) 7) 
        )
        :effect (and
            (decrease (stay-A-remaining) 1)
            (increase (current-day) 1)
            (increase (total-cost) 1)
        )
    )

    ; Action to spend a required day in Zurich
    (:action stay-day-Z
        :parameters ()
        :precondition (and 
            (at zurich) 
            (>= (stay-Z-remaining) 1)
        )
        :effect (and
            (decrease (stay-Z-remaining) 1)
            (increase (current-day) 1)
            (increase (total-cost) 1)
        )
    )
    
    ; Action to spend a required day in Krakow
    (:action stay-day-K
        :parameters ()
        :precondition (and 
            (at krakow) 
            (>= (stay-K-remaining) 1)
        )
        :effect (and
            (decrease (stay-K-remaining) 1)
            (increase (current-day) 1)
            (increase (total-cost) 1)
        )
    )

    ; Decomposed Flight Actions (1 day travel cost). Requires stays in origin city to be complete.
    
    (:action fly-A-Z
        :parameters ()
        :precondition (and
            (at athens)
            (= (stay-A-remaining) 0)
            (is-connected athens zurich)
        )
        :effect (and
            (not (at athens))
            (at zurich)
            (increase (current-day) 1)
            (increase (total-cost) 1) 
        )
    )

    (:action fly-Z-A
        :parameters ()
        :precondition (and
            (at zurich)
            (= (stay-Z-remaining) 0)
            (is-connected zurich athens)
        )
        :effect (and
            (not (at zurich))
            (at athens)
            (increase (current-day) 1)
            (increase (total-cost) 1) 
        )
    )

    (:action fly-Z-K
        :parameters ()
        :precondition (and
            (at zurich)
            (= (stay-Z-remaining) 0)
            (is-connected zurich krakow)
        )
        :effect (and
            (not (at zurich))
            (at krakow)
            (increase (current-day) 1)
            (increase (total-cost) 1) 
        )
    )
    
    (:action fly-K-Z
        :parameters ()
        :precondition (and
            (at krakow)
            (= (stay-K-remaining) 0)
            (is-connected krakow zurich)
        )
        :effect (and
            (not (at krakow))
            (at zurich)
            (increase (current-day) 1)
            (increase (total-cost) 1) 
        )
    )
)