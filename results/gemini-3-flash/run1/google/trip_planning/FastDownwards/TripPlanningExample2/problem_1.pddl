(define (problem trip_planning_example_2)
  (:domain trip_planning_domain)
  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 - count
  )
  (:init
    ;; Start location and time
    (current_loc reykjavik)
    (current_day d1)

    ;; Initial counts for cities
    (spent_count reykjavik c0)
    (spent_count vienna c0)
    (spent_count venice c0)

    ;; Temporal succession
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
    (next_day d11 d12)

    ;; Count succession
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)

    ;; Flight connectivity
    (flight reykjavik vienna)
    (flight vienna reykjavik)
    (flight vienna venice)
    (flight venice vienna)
  )
  (:goal (and
    ;; Total stay requirements
    (spent_count reykjavik c2)
    (spent_count vienna c7)
    (spent_count venice c4)

    ;; Wedding requirements in Venice (Days 8 to 11)
    (at_city_day venice d8)
    (at_city_day venice d9)
    (at_city_day venice d10)
    (at_city_day venice d11)

    ;; Ensure 11 days are planned
    (current_day d12)
  ))
)