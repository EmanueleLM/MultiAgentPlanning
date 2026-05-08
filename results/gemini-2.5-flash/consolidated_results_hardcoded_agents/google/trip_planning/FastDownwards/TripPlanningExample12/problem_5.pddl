(define (problem trip-itinerary)
    (:domain trip-planning)
    (:objects
        valencia amsterdam tallinn home - city
    )

    (:init
        ; Locations
        (at home)

        ; Connectivity: V<->A, A<->T, H<->A (assuming A is the entry/exit hub)
        (connected valencia amsterdam)
        (connected amsterdam valencia)
        (connected amsterdam tallinn)
        (connected tallinn amsterdam)
        
        (connected home amsterdam)
        (connected amsterdam home)
        
        ; State Tracking
        (not (visited valencia))
        (not (visited amsterdam))
        (not (visited tallinn))
        (not (deficit-calculated))
        (not (tallinn-met))
        
        ; Initial Fluents
        (= (total-time) 0)
        (= (total-cost) 0)
        (= (TIME-LIMIT) 15) ; Hard time limit

        ; Actual Durations
        (= (duration valencia) 0)
        (= (duration amsterdam) 0)
        (= (duration tallinn) 0)

        ; Desired Duration Deficits (V=5, A=5, T=7)
        (= (max-v) 5)
        (= (max-a) 5)
        (= (max-t) 7)
    )

    (:goal (and
        (at home)
        (visited valencia)
        (visited amsterdam)
        (visited tallinn)
        (tallinn-met) ; Hard temporal constraint met
    ))

    (:metric minimize (total-cost))