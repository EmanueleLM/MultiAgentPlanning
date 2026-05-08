(define (problem trip_planning_example2_problem)
    (:domain trip_planning_example2)
    (:objects
        reykjavik vienna venice - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    )
    (:init
        ; Initial location (arbitrarily chosen, as not specified in prompt)
        (at reykjavik)
        ; Initial day
        (current_day d1)

        ; Day sequencing
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10)
        (next_day d10 d11)
        (next_day d11 d12) ; End of day 11, entering d12 state

        ; Direct flights
        (has_flight reykjavik vienna)
        (has_flight vienna reykjavik)
        (has_flight vienna venice)
        (has_flight venice vienna)
    )
    (:goal (and
        ; Total trip duration is 11 days (goal state after day 11)
        (current_day d12)

        ; Wedding in Venice between day 8 and day 11 (inclusive) - HARD CONSTRAINT
        (visited_city_on_day venice d8)
        (visited_city_on_day venice d9)
        (visited_city_on_day venice d10)
        (visited_city_on_day venice d11)

        ; Reykjavik visit requires 2 days
        ; (Arbitrarily assigned days that don't directly conflict with Venice wedding, but contribute to overall impossibility)
        (visited_city_on_day reykjavik d1)
        (visited_city_on_day reykjavik d2)

        ; Vienna visit requires 7 days
        ; These days are chosen to demonstrate the impossibility.
        ; Days d3-d7 use up the remaining non-wedding, non-Reykjavik days.
        ; d8 and d9 are then required for Vienna, creating direct contradiction with Venice requirements.
        (visited_city_on_day vienna d3)
        (visited_city_on_day vienna d4)
        (visited_city_on_day vienna d5)
        (visited_city_on_day vienna d6)
        (visited_city_on_day vienna d7)
        (visited_city_on_day vienna d8) ; Contradicts (visited_city_on_day venice d8)
        (visited_city_on_day vienna d9) ; Contradicts (visited_city_on_day venice d9)
    ))
)