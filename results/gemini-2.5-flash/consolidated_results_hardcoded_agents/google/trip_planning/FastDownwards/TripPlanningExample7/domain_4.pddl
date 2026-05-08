(define (domain TripPlanningDomain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city)
    (:constants
        venice dubrovnik istanbul - city
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct_flight ?from ?to - city)
    )
    (:functions
        (total-time) - number
        (days-venice) - number
        (days-dubrovnik) - number
        (days-istanbul) - number
    )

    ; Generalized Flight action (1 day travel, must be under the 11 day budget)
    (:action fly
        :parameters (?from ?to - city)
        :precondition (and 
            (at ?from) 
            (direct_flight ?from ?to)
            ; Max time is 11. Since this takes 1 unit, we must have <= 10 beforehand.
            (<= (total-time) 10) 
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            (increase (total-time) 1)
        )
    )

    ; Stay Actions (1 day duration, bounded by trip budget and individual stay maximums)

    (:action stay_venice
        :parameters ()
        :precondition (and 
            (at venice)
            (<= (total-time) 10) ; Budget: <= 11 total
            (<= (days-venice) 5) ; Max stay: 6 days (current days must be <= 5)
        )
        :effect (and 
            (increase (total-time) 1)
            (increase (days-venice) 1)
        )
    )

    (:action stay_dubrovnik
        :parameters ()
        :precondition (and 
            (at dubrovnik)
            (<= (total-time) 10) ; Budget: <= 11 total
            (<= (days-dubrovnik) 3) ; Max stay: 4 days (current days must be <= 3)
        )
        :effect (and 
            (increase (total-time) 1)
            (increase (days-dubrovnik) 1)
        )
    )
    
    (:action stay_istanbul
        :parameters ()
        :precondition (and 
            (at istanbul)
            (<= (total-time) 10) ; Budget: <= 11 total
            (<= (days-istanbul) 2) ; Max stay: 3 days (current days must be <= 2)
        )
        :effect (and 
            (increase (total-time) 1)
            (increase (days-istanbul) 1)
        )
    )
)