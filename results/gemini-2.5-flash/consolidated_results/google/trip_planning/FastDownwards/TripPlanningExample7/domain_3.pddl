(define (domain TripPlanningDomain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city)
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

    ; Flight actions (1 day travel, must be under the 11 day budget)
    
    (:action fly_dubrovnik_to_istanbul
        :parameters ()
        :precondition (and 
            (at dubrovnik) 
            (direct_flight dubrovnik istanbul)
            (< (total-time) 11)
        )
        :effect (and
            (not (at dubrovnik))
            (at istanbul)
            (visited istanbul)
            (increase (total-time) 1)
        )
    )

    (:action fly_dubrovnik_to_venice
        :parameters ()
        :precondition (and 
            (at dubrovnik) 
            (direct_flight dubrovnik venice)
            (< (total-time) 11)
        )
        :effect (and
            (not (at dubrovnik))
            (at venice)
            (visited venice)
            (increase (total-time) 1)
        )
    )

    ; Stay Actions (1 day duration, track city stay days, bounded by trip budget and individual stay maximums)

    (:action stay_venice
        :parameters ()
        :precondition (and 
            (at venice)
            (< (total-time) 11)
            (< (days-venice) 6)
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
            (< (total-time) 11)
            (< (days-dubrovnik) 4)
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
            (< (total-time) 11)
            (< (days-istanbul) 3)
        )
        :effect (and 
            (increase (total-time) 1)
            (increase (days-istanbul) 1)
        )
    )
)