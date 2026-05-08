(define (problem TripPlanningExample24)
    (:domain trip_planning)
    (:objects
        florence amsterdam riga - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
        c0 c1 c2 c3 c4 c5 - day_count
    )
    (:init
        (at florence)
        (current_day d1)
        (visited florence) ; implicitly visited as we start there

        ;; Day sequence
        (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
        (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
        (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)

        ;; Flight connections
        (connected florence amsterdam)
        (connected amsterdam florence)
        (connected amsterdam riga)
        (connected riga amsterdam)

        ;; Initial stay counts
        (florence_stay_count c0)
        (amsterdam_stay_count c0)
        (riga_stay_count c0)

        ;; Day count sequence for stays
        (next_count c0 c1)
        (next_count c1 c2)
        (next_count c2 c3)
        (next_count c3 c4)
        (next_count c4 c5)
    )
    (:goal (and
        (current_day d13)
        (visited florence)
        (visited amsterdam)
        (visited riga)
        (florence_stay_count c4)    ; Exactly 4 days in Florence
        (amsterdam_stay_count c5)   ; Exactly 5 days in Amsterdam (adjusted)
        (riga_stay_count c4)        ; Exactly 4 days in Riga (adjusted)
    ))
)