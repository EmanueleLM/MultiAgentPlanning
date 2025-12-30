(define (problem trip-planning-p1)
    (:domain trip-planning)
    (:objects
        riga manchester split - city
    )
    (:init
        (= (total-time) 0)
        (= (trip-cost) 0)

        ; Initial location: Start at Riga (arbitrary starting point allowing all visits)
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
        (= (total-time) 15)
        (visited riga)
        (visited manchester)
        (visited split)
    ))

    (:metric minimize (trip-cost))