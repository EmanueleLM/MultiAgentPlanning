(define (problem trip_planning_example2_problem)
    (:domain trip_planning_example2)
    (:objects
        reykjavik vienna venice - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    )
    (:init
        ; Initial location (arbitrarily chosen, as not specified in prompt, but assuming starting at one of the cities)
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

        ; Wedding in Venice between day 8 and day 11 (inclusive) - HARD CONSTRAINT, prioritized by orchestrator
        (visited_city_on_day venice d8)
        (visited_city_on_day venice d9)
        (visited_city_on_day venice d10)
        (visited_city_on_day venice d11)

        ; Ensure all mentioned cities are visited at least once.
        ; The full duration requirements (Reykjavik 2, Vienna 7) cannot be met
        ; within the 11-day limit alongside the Venice wedding constraint (4 days),
        ; as the sum of required stays (13 days) exceeds available days (11 days).
        ; This goal prioritizes the wedding and total duration while ensuring other cities are included.
        (visited reykjavik)
        (visited vienna)
        (visited venice) ; Venice is implicitly visited due to wedding, but included for completeness.
    ))
)