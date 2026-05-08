(define (problem trip-planning-p1)
    (:domain trip-planning)
    (:objects
        riga manchester split - city
    )
    (:init
        (= (total-time) 0)
        (= (total-cost) 0)

        ; Initial location: Start at Riga (Arbitrary starting point ensuring feasibility of travel)
        (at riga)
        (visited riga) 

        ; Time spent initialization
        (= (time-spent-in riga) 0)
        (= (time-spent-in manchester) 0)
        (= (time-spent-in split) 0)

        ; Required durations (Split=6, Manchester=4, Riga=7)
        (= (required-duration riga) 7)
        (= (required-duration manchester) 4)
        (= (required-duration split) 6)
        
        ; Connectivity: Riga <-> Manchester, Manchester -> Split
        (direct-flight riga manchester)
        (direct-flight manchester riga)
        (direct-flight manchester split)
    )
    
    (:goal (and
        (= (total-time) 15) ; Hard constraint: Total duration must be exactly 15 days
        (visited riga)
        (visited manchester)
        (visited split)
    ))

    (:metric minimize (total-cost))
)