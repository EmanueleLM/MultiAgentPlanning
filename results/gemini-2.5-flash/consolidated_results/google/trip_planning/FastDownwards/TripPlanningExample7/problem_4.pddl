(define (problem TripPlanningProblem)
    (:domain TripPlanningDomain)
    ; Cities are defined as constants in the domain, so no objects needed here.
    
    (:init
        ; Location and Visited (Starts in Dubrovnik, already visited)
        (at dubrovnik)
        (visited dubrovnik)
        
        ; Connectivity
        (direct_flight dubrovnik istanbul)
        (direct_flight dubrovnik venice)

        ; Initialize numeric fluents
        (= (total-time) 0)
        (= (days-venice) 0)
        (= (days-dubrovnik) 0)
        (= (days-istanbul) 0)
    )
    (:goal (and
        ; 1. Visit all cities
        (visited venice)
        (visited istanbul)
        
        ; 2. Strict total duration limit of 11 days (must utilize the full budget)
        (= (total-time) 11)
    ))
    ; Metric: Prioritize fulfilling stay requirements by maximizing total stay days achieved.
    (:metric maximize (+ (days-venice) (days-dubrovnik) (days-istanbul)))
)