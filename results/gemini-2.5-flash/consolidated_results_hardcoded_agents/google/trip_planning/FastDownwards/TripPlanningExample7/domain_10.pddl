(define (domain TripPlanningDomain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        city
    )
    (:constants
        venice dubrovnik istanbul - city
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct_flight ?from ?to - city)
    )
    
    (:functions
        (total-cost) - number
        (current-day) - number
        (days-venice) - number
        (days-dubrovnik) - number
        (days-istanbul) - number
    )
    
    ; Flight Action (1 day travel, high cost 10)
    (:action fly
        :parameters (?from ?to - city)
        :precondition (and 
            (at ?from) 
            (direct_flight ?from ?to)
            ; Budget constraint: must not exceed 11 days total
            (< (current-day) 11)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            (increase (current-day) 1)
            (increase (total-cost) 10) 
        )
    )

    ; 1. Stay Venice (Max 6 days required)
    (:action stay_venice
        :parameters ()
        :precondition (and 
            (at venice)
            (< (current-day) 11)
            (< (days-venice) 6)
        )
        :effect (and 
            (increase (current-day) 1)
            (increase (days-venice) 1)
            (increase (total-cost) 1) ; Lower cost prioritizes staying
        )
    )

    ; 2. Stay Dubrovnik (Max 4 days required)
    (:action stay_dubrovnik
        :parameters ()
        :precondition (and 
            (at dubrovnik)
            (< (current-day) 11)
            (< (days-dubrovnik) 4)
        )
        :effect (and 
            (increase (current-day) 1)
            (increase (days-dubrovnik) 1)
            (increase (total-cost) 1) 
        )
    )

    ; 3. Stay Istanbul (Max 3 days required)
    (:action stay_istanbul
        :parameters ()
        :precondition (and 
            (at istanbul)
            (< (current-day) 11)
            (< (days-istanbul) 3)
        )
        :effect (and 
            (increase (current-day) 1)
            (increase (days-istanbul) 1)
            (increase (total-cost) 1) 
        )
    )
)