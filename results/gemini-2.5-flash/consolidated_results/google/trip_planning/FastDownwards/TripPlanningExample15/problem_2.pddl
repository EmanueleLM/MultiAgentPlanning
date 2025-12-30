(define (problem trip-15-orchestrated)
    (:domain trip-planning-v15)
    (:objects) 

    (:init
        ; Initial location and time
        (at krakow)
        (current-day d1)
        (= (total-cost) 0)

        ; Day sequencing D1 -> D11
        (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) 
        (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) 
        (next-day d7 d8) (next-day d8 d9) (next-day d9 d10)
        (next-day d10 d11)

        ; Connectivity (Only direct connections allowed)
        (connection berlin porto)
        (connection porto berlin)
        (connection krakow berlin)
        (connection berlin krakow)

        ; Number sequencing (0 to 11)
        (is-successor n0 n1) (is-successor n1 n2) (is-successor n2 n3)
        (is-successor n3 n4) (is-successor n4 n5) (is-successor n5 n6)
        (is-successor n6 n7) (is-successor n7 n8) (is-successor n8 n9)
        (is-successor n9 n10) (is-successor n10 n11)

        ; Initial stay counts (all 0)
        (stay-count berlin n0)
        (stay-count porto n0)
        (stay-count krakow n0)
    )

    (:goal (and
        ; Achieved stays after conflict resolution (4 Berlin, 3 Krakow, 2 Porto => 9 stay days, 2 travel days, 11 total steps)
        (stay-count berlin n4)
        (stay-count krakow n3)
        (stay-count porto n2)
        (current-day d11) ; Ensure we have completed the D10 action and reached D11 state
    ))
    
    ; Minimize cost ensures exactly 11 steps are taken to meet the 11-day duration constraint.
    (:metric minimize (total-cost))