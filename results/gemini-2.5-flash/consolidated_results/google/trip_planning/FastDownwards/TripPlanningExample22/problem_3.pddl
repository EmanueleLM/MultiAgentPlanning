(define (problem trip-planning-p22)
    (:domain trip-planning-orchestrator)
    (:objects
        frankfurt bucharest berlin - city
    )
    
    (:init
        ; Connectivity: B <-> F, F <-> Bu
        (connected berlin frankfurt)
        (connected frankfurt berlin)
        (connected frankfurt bucharest)
        (connected bucharest frankfurt)

        ; Start on Day 1 in Berlin
        (at berlin) 

        ; Initial numeric state
        (= (current-day-number) 1)
        (= (days-in-frankfurt) 0)
        (= (days-in-bucharest) 0)
        (= (days-in-berlin-show) 0)
        (= (total-cost) 0)
    )

    (:goal (and
        ; 1. Trip duration must be exactly 11 days
        (= (current-day-number) 12)
        ; 2. Berlin show requirement met (7 days D1-D7)
        (= (days-in-berlin-show) 7)
        ; 3. Ensure all cities were visited (by requiring >0 days spent there)
        (> (days-in-frankfurt) 0)
        (> (days-in-bucharest) 0)
    ))
    
    (:metric minimize (total-cost))
)