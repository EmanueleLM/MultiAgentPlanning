(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    stockholm athens mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n0 n1 n2 n3 n4 n5 n6 - count
  )
  (:init
    ;; Starting location: Stockholm (needed for Day 1 conference)
    (at_city stockholm)
    (current_day d1)

    ;; Initial stay counts (no days spent yet)
    (stay_count stockholm n0)
    (stay_count athens n0)
    (stay_count mykonos n0)

    ;; Temporal progression: 13 days of activities (reaching Day 14)
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
    (next_day d12 d13)
    (next_day d13 d14)

    ;; Counter progression (up to 6 days for Stockholm)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)

    ;; Flight connectivity
    (can_fly stockholm athens)
    (can_fly athens stockholm)
    (can_fly athens mykonos)
    (can_fly mykonos athens)

    ;; Conference constraints: 
    ;; Day 1 and Day 6 require Stockholm at the start of the day.
    (is_city_at_day_allowed stockholm d1)
    (is_city_at_day_allowed stockholm d6)

    ;; Other days allow starting from any city.
    (is_city_at_day_allowed stockholm d2) (is_city_at_day_allowed athens d2) (is_city_at_day_allowed mykonos d2)
    (is_city_at_day_allowed stockholm d3) (is_city_at_day_allowed athens d3) (is_city_at_day_allowed mykonos d3)
    (is_city_at_day_allowed stockholm d4) (is_city_at_day_allowed athens d4) (is_city_at_day_allowed mykonos d4)
    (is_city_at_day_allowed stockholm d5) (is_city_at_day_allowed athens d5) (is_city_at_day_allowed mykonos d5)
    (is_city_at_day_allowed stockholm d7) (is_city_at_day_allowed athens d7) (is_city_at_day_allowed mykonos d7)
    (is_city_at_day_allowed stockholm d8) (is_city_at_day_allowed athens d8) (is_city_at_day_allowed mykonos d8)
    (is_city_at_day_allowed stockholm d9) (is_city_at_day_allowed athens d9) (is_city_at_day_allowed mykonos d9)
    (is_city_at_day_allowed stockholm d10) (is_city_at_day_allowed athens d10) (is_city_at_day_allowed mykonos d10)
    (is_city_at_day_allowed stockholm d11) (is_city_at_day_allowed athens d11) (is_city_at_day_allowed mykonos d11)
    (is_city_at_day_allowed stockholm d12) (is_city_at_day_allowed athens d12) (is_city_at_day_allowed mykonos d12)
    (is_city_at_day_allowed stockholm d13) (is_city_at_day_allowed athens d13) (is_city_at_day_allowed mykonos d13)
  )
  (:goal
    (and
      ;; Total trip duration (13 days) reached.
      (current_day d14)
      ;; Specific stay requirements met.
      (stay_count stockholm n6)
      (stay_count athens n5)
      (stay_count mykonos n4)
    )
  )
)