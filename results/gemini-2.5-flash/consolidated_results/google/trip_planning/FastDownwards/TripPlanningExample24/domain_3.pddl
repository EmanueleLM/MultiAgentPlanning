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
        (current-day) ; Tracks the day currently being processed (1 to 13. Goal reached when 14)
        (days-in-F-spent) ; Required 4 days spent in Florence
        (days-in-A-remaining) ; Required 4 days remaining in Amsterdam
        (days-in-R-remaining) ; Required 3 days remaining in Riga
    )

    ; F stay D1-D4 (Workshop constraint)
    (:action stay-in-florence
        :parameters ()
        :precondition (and 
            (at florence)
            (< (days-in-F-spent) 4)
            (>= (current-day) 1)
            (< (current-day) 5) ; Must occur on Day 1, 2, 3, or 4
        )
        :effect (and
            (increase (current-day) 1)
            (increase (days-in-F-spent) 1)
        )
    )
    
    ; Travel F -> A (D5)
    (:action travel-F-A
        :parameters ()
        :precondition (and 
            (at florence) 
            (connected florence amsterdam) 
            (= (days-in-F-spent) 4) ; F stay completed
            (= (current-day) 5) ; Must travel on D5
        )
        :effect (and
            (not (at florence))
            (at amsterdam)
            (increase (current-day) 1) ; Day 6 starts
        )
    )

    ; A stay D6-D9 (4 days)
    (:action stay-in-amsterdam
        :parameters ()
        :precondition (and 
            (at amsterdam)
            (> (days-in-A-remaining) 0)
            (>= (current-day) 6)
            (< (current-day) 10) ; Must occur D6, D7, D8, or D9
        )
        :effect (and
            (increase (current-day) 1)
            (decrease (days-in-A-remaining) 1)
        )
    )

    ; Travel A -> R (D10)
    (:action travel-A-R
        :parameters ()
        :precondition (and 
            (at amsterdam) 
            (connected amsterdam riga) 
            (= (days-in-A-remaining) 0) ; A stay completed
            (= (current-day) 10) ; Must travel on D10
        )
        :effect (and
            (not (at amsterdam))
            (at riga)
            (increase (current-day) 1) ; Day 11 starts
        )
    )

    ; R stay D11-D13 (3 days)
    (:action stay-in-riga
        :parameters ()
        :precondition (and 
            (at riga)
            (> (days-in-R-remaining) 0)
            (>= (current-day) 11)
            (< (current-day) 14) ; Must occur D11, D12, or D13
        )
        :effect (and
            (increase (current-day) 1)
            (decrease (days-in-R-remaining) 1)
        )
    )
)