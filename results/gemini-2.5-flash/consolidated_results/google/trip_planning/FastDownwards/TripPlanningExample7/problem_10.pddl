(define (problem TripPlanningProblem)
    (:domain TripPlanningDomain)
    
    (:init
        ; Initial Location
        (at dubrovnik)
        (visited dubrovnik)
        
        ; Connectivity (Must assume necessary return flights for connectivity)
        (direct_flight dubrovnik istanbul)
        (direct_flight dubrovnik venice)
        (direct_flight istanbul dubrovnik)
        (direct_flight venice dubrovnik)

        ; Initialize Numeric Fluents (Replaces all time/stay progression enumeration)
        (= (total-cost) 0)
        (= (current-day) 0)
        (= (days-venice) 0)
        (= (days-dubrovnik) 0)
        (= (days-istanbul) 0)
    )
    
    (:goal (and
        ; 1. Visit all required cities
        (visited venice)
        (visited istanbul)
        
        ; 2. Strict total duration limit of 11 days 
        (= (current-day) 11)
    ))
    
    ; Metric: Minimize the cost (Maximize achievable stays: stay=1, flight=10)
    (:metric minimize (total-cost))
)