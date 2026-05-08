(define (domain trip-planning-9)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city - object
    )

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city) 
    )

    (:functions
        (current-day)
        (stay-days-f)
        (stay-days-b)
        (stay-days-s)
        (total-cost) 
    )

    ; Travel action (happens within a day)
    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            (not (= ?from ?to))
            ; We can travel on any day 1 through 10
            (<= (current-day) 10)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (total-cost) 1) ; Cost for movement
        )
    )

    ; Daily Progression Actions (D_i -> D_{i+1}, for i=1 to 9)
    
    ; 1. Stay in Stuttgart (S)
    (:action progress-day-stay-s
        :parameters ()
        :precondition (and
            (at stuttgart)
            (< (current-day) 10) ; Only D1 through D9 can execute this to reach D10
        )
        :effect (and
            (increase (current-day) 1)
            (increase (stay-days-s) 1)
        )
    )

    ; 2. Stay in Frankfurt (F) - Blocked during Workshop D5-D9 progression
    (:action progress-day-stay-f
        :parameters ()
        :precondition (and
            (at frankfurt)
            (< (current-day) 10)
            ; Hard Constraint D5-D10: Cannot progress days 5, 6, 7, 8, or 9 in F. 
            ; Only allowed if current day is 1, 2, 3, or 4.
            (< (current-day) 5) 
        )
        :effect (and
            (increase (current-day) 1)
            (increase (stay-days-f) 1)
        )
    )

    ; 3. Stay in Bucharest (B) - Blocked during Workshop D5-D9 progression
    (:action progress-day-stay-b
        :parameters ()
        :precondition (and
            (at bucharest)
            (< (current-day) 10)
            ; Hard Constraint D5-D10: Cannot progress days 5, 6, 7, 8, or 9 in B. 
            (< (current-day) 5) 
        )
        :effect (and
            (increase (current-day) 1)
            (increase (stay-days-b) 1)
        )
    )

    ; Final day stay (D10). Only allowed in S due to hard constraint D5-D10.
    (:action finish-trip-s
        :parameters ()
        :precondition (and
            (at stuttgart)
            (= (current-day) 10)
        )
        :effect (and
            (increase (stay-days-s) 1)
        )
    )
)