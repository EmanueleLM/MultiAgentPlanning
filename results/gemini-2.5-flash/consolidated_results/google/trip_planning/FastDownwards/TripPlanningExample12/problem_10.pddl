(define (problem trip-itinerary)
    (:domain trip-planning)
    (:objects
    )

    (:init
        ; Locations
        (at home)

        ; Connectivity: V<->A, A<->T, H<->A (A must be the hub for all travelers)
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
        (= (total-time) 15) ; Ensure the itinerary uses the full 15 days available for maximizing stay
    ))

    (:metric minimize (total-cost))
)