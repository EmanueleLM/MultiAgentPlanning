(define (problem trip-planning-p9)
    (:domain trip-planning-9)
    (:objects
        frankfurt bucharest stuttgart - city
    )
    (:init
        ; Locations and Connections (B<->F, F<->S)
        (at frankfurt) ; Starting location assumed (F)
        (connected bucharest frankfurt)
        (connected frankfurt bucharest)
        (connected frankfurt stuttgart)
        (connected stuttgart frankfurt)

        ; Initial numerical state
        (= (current-day) 1)
        (= (stay-days-f) 0)
        (= (stay-days-b) 0)
        (= (stay-days-s) 0)
        (= (total-cost) 0)
    )
    (:goal
        (and
            ; 9 progress steps must have occurred to reach Day 10
            (= (current-day) 10)
            ; The final trip action (finish-trip-s) must have run, ensuring 10 days are counted.
            (= (+ (stay-days-f) (stay-days-b) (stay-days-s)) 10)
        )
    )
    
    (:metric minimize
        (+ 
            ; 1. Minimize travel cost (1 per movement)
            (total-cost) 
            
            ; 2. Penalize missing desired stay days (F=3, B=3, S=6). Penalty P=100 per day missing (Soft constraints/Preferences).
            ; We use max(0, deficit) to ensure no reward for overstaying.
            (* 100 (max 0 (- 3 (stay-days-f))))
            (* 100 (max 0 (- 3 (stay-days-b))))
            (* 100 (max 0 (- 6 (stay-days-s))))
        )
    )
)