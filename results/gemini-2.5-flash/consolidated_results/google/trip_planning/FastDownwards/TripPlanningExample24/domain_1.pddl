(define (domain trip-planning-24)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        city
    )

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
    )

    (:functions
        (current-day) ; Tracks the day currently being processed (starts 1, ends 14 for 13 days)
        (days-in-F-spent) ; Required 4 days spent in Florence
        (days-in-A-remaining) ; Required 4 days remaining in Amsterdam
        (days-in-R-remaining) ; Required 3 days remaining in Riga
        (total-cost)
    )

    ; F stay D1-D4
    (:action stay-in-florence
        :parameters ()
        :precondition (and 
            (at florence)
            (< (days-in-F-spent) 4)
            (< (current-day) 14) 
        )
        :effect (and
            (increase (current-day) 1)
            (increase (days-in-F-spent) 1)
            (increase (total-cost) 1)
        )
    )
    
    ; Travel F -> A (Must happen on Day 5)
    (:action travel-F-A
        :parameters ()
        :precondition (and 
            (at florence) 
            (connected florence amsterdam) 
            (= (days-in-F-spent) 4) ; F stay completed
            (< (current-day) 14) 
        )
        :effect (and
            (not (at florence))
            (at amsterdam)
            (increase (current-day) 1) ; Travel uses 1 day
            (increase (total-cost) 10) 
        )
    )

    ; A stay (Required 4 days: D6-D9)
    (:action stay-in-amsterdam
        :parameters ()
        :precondition (and 
            (at amsterdam)
            (> (days-in-A-remaining) 0)
            (< (current-day) 14)
        )
        :effect (and
            (increase (current-day) 1)
            (decrease (days-in-A-remaining) 1)
            (increase (total-cost) 1)
        )
    )

    ; Travel A -> R (Must happen on Day 10)
    (:action travel-A-R
        :parameters ()
        :precondition (and 
            (at amsterdam) 
            (connected amsterdam riga) 
            (= (days-in-A-remaining) 0) ; A stay completed
            (< (current-day) 14)
        )
        :effect (and
            (not (at amsterdam))
            (at riga)
            (increase (current-day) 1) ; Travel uses 1 day
            (increase (total-cost) 10)
        )
    )

    ; R stay (Required 3 days: D11-D13)
    (:action stay-in-riga
        :parameters ()
        :precondition (and 
            (at riga)
            (> (days-in-R-remaining) 0)
            (< (current-day) 14)
        )
        :effect (and
            (increase (current-day) 1)
            (decrease (days-in-R-remaining) 1)
            (increase (total-cost) 1)
        )
    )
)