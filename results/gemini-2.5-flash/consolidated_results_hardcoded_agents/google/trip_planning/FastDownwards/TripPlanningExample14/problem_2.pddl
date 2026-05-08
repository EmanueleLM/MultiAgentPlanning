(define (problem TripPlanningExample14)
    (:domain TripPlanning14)
    (:objects
        lyon frankfurt krakow - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    )

    (:init
        ; Location and Time
        (at lyon)
        (current_day d1)

        ; Day sequencing (10 steps required)
        (day_after d1 d2) (day_after d2 d3) (day_after d3 d4)
        (day_after d4 d5) (day_after d5 d6) (day_after d6 d7)
        (day_after d7 d8) (day_after d8 d9) (day_after d9 d10)
        (day_after d10 d11)

        ; Connectivity
        (connected lyon frankfurt)
        (connected frankfurt lyon)
        (connected frankfurt krakow)
        (connected krakow frankfurt)

        ; Temporal constraint enforcement: Days 8, 9, 10 require staying in Krakow
        (is_fixed_k_day d8)
        (is_fixed_k_day d9)
        (is_fixed_k_day d10)

        ; Fluents initialization
        (= (total-cost) 0)
        (= (l-stays) 0)
        (= (f-stays) 0)
        (= (k-stays) 0)
    )

    (:goal (and
        (current_day d11)
        (= (total-cost) 10)
        ; Final location check 
        (at krakow) 
        ; Reconciled Stay Targets (4L, 1F, 3K)
        (= (l-stays) 4)
        (= (f-stays) 1)
        (= (k-stays) 3)
    ))

    (:metric minimize (total-cost))