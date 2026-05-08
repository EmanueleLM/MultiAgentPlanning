(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    manchester oslo reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    ;; Initial location and time
    (at_city manchester)
    (current_day d1)

    ;; City connectivity (direct flights)
    (flight manchester oslo)
    (flight oslo manchester)
    (flight oslo reykjavik)
    (flight reykjavik oslo)

    ;; Day progression
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Counting sequence
    (next_val c0 c1)
    (next_val c1 c2)
    (next_val c2 c3)
    (next_val c3 c4)
    (next_val c4 c5)
    (next_val c5 c6)

    ;; Initialize stay counts
    (city_stay_count manchester c0)
    (city_stay_count oslo c0)
    (city_stay_count reykjavik c0)
  )
  (:goal
    (and
      ;; Complete the 8-day trip
      (current_day d9)

      ;; Wedding requirement: Must be in Manchester on Day 1 and Day 2
      (visited manchester d1)
      (visited manchester d2)

      ;; Stay requirements
      (city_stay_count manchester c2)
      (city_stay_count oslo c6)
      (city_stay_count reykjavik c2)
    )
  )
)