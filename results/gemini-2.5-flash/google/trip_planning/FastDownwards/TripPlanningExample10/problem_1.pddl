(define (problem trip_planning_instance_10)
    (:domain trip_planning_repaired)
    (:objects
        oslo dublin valencia - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d_end - day
    )
    (:init
        (at oslo) ; Starting point (consistent with O->D->V sequence for this problem)
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

        ; Initial state for flags (implicitly false if not stated, but good practice to be explicit for clarity if needed)
        ; (not (has_visited oslo))
        ; (not (has_visited dublin))
        ; (not (has_visited valencia))
        ; (not (day_is_spent d1)) ... (not (day_is_spent d9))
    )
    (:goal (and
        (on_day d_end)           ; Ensures all 9 days are accounted for
        (day_is_spent d9)        ; Ensures the final day (d9) was explicitly spent
        (at valencia)            ; Final location is Valencia
        (has_visited oslo)
        (has_visited dublin)
        (has_visited valencia)
    ))
)