(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    stockholm athens mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n0 n1 n2 n3 n4 n5 n6 - count
  )
  (:init
    ;; Starting conditions: At Stockholm on Day 1
    (at_city stockholm)
    (current_day d1)

    ;; Initial stay counts for all cities
    (stay_count stockholm n0)
    (stay_count athens n0)
    (stay_count mykonos n0)

    ;; Temporal progression (13 days of travel)
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

    ;; Counter progression (up to 6 days)
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
    ;; Day 1 and Day 6 require Stockholm.
    (can_stay_at stockholm d1)
    (can_stay_at stockholm d6)

    ;; Other days allow staying in any city.
    (can_stay_at stockholm d2) (can_stay_at athens d2) (can_stay_at mykonos d2)
    (can_stay_at stockholm d3) (can_stay_at athens d3) (can_stay_at mykonos d3)
    (can_stay_at stockholm d4) (can_stay_at athens d4) (can_stay_at mykonos d4)
    (can_stay_at stockholm d5) (can_stay_at athens d5) (can_stay_at mykonos d5)
    (can_stay_at stockholm d7) (can_stay_at athens d7) (can_stay_at mykonos d7)
    (can_stay_at stockholm d8) (can_stay_at athens d8) (can_stay_at mykonos d8)
    (can_stay_at stockholm d9) (can_stay_at athens d9) (can_stay_at mykonos d9)
    (can_stay_at stockholm d10) (can_stay_at athens d10) (can_stay_at mykonos d10)
    (can_stay_at stockholm d11) (can_stay_at athens d11) (can_stay_at mykonos d11)
    (can_stay_at stockholm d12) (can_stay_at athens d12) (can_stay_at mykonos d12)
    (can_stay_at stockholm d13) (can_stay_at athens d13) (can_stay_at mykonos d13)
  )
  (:goal
    (and
      ;; Stay requirements: Stockholm (6), Athens (5), Mykonos (4)
      ;; Note: The sum (15) exceeds the trip duration (13).
      (stay_count stockholm n6)
      (stay_count athens n5)
      (stay_count mykonos n4)
      ;; Trip duration constraint: 13 days passed.
      (current_day d14)
    )
  )
)