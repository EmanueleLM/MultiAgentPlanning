(define (problem trip_planning_instance_10)
    (:domain trip_planning_repaired)
    (:objects
        oslo dublin valencia - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d_end - day
        n0 n1 n2 n3 n4 n5 - num_days
    )
    (:init
        (at oslo) ; Starting point as specified by problem context (O->D->V sequence)
        (on_day d1)

        ; City connections (direct flights are bidirectional)
        (connected oslo dublin)
        (connected dublin oslo)
        (connected dublin valencia)
        (connected valencia dublin)

        ; Day sequencing
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d_end)

        ; Valencia fixed stay days (5 days, from day 5 to day 9 inclusive)
        (valencia_occupied_on_day d5)
        (valencia_occupied_on_day d6)
        (valencia_occupied_on_day d7)
        (valencia_occupied_on_day d8)
        (valencia_occupied_on_day d9)

        ; Initial day counts for cities
        (days_spent_in oslo n0)
        (days_spent_in dublin n0)
        (days_spent_in valencia n0)

        ; Number sequence for day counting
        (next_num n0 n1)
        (next_num n1 n2)
        (next_num n2 n3)
        (next_num n3 n4)
        (next_num n4 n5)
    )
    (:goal (and
        (on_day d_end)           ; Ensures all 9 days are accounted for
        (day_is_spent d9)        ; Ensures the final day (d9) was explicitly spent
        (at valencia)            ; Final location is Valencia
        (has_visited oslo)
        (has_visited dublin)
        (has_visited valencia)
        (days_spent_in valencia n5) ; Valencia must be visited for exactly 5 days (days 5-9)
        ; Oslo and Dublin must share the remaining 4 days (Days 1-4)
        (or
            (and (days_spent_in oslo n1) (days_spent_in dublin n3)) ; 1 day Oslo, 3 days Dublin
            (and (days_spent_in oslo n2) (days_spent_in dublin n2)) ; 2 days Oslo, 2 days Dublin
            (and (days_spent_in oslo n3) (days_spent_in dublin n1)) ; 3 days Oslo, 1 day Dublin
        )
    ))