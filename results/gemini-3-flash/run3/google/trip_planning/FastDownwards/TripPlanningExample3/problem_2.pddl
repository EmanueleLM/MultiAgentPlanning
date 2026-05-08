(define (problem trip_planning_example_3)
  (:domain trip_planning)
  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
    n0 n1 n2 n3 - count_val
  )
  (:init
    ;; Time progression
    (current_day d1)
    (next_day_order d1 d2)
    (next_day_order d2 d3)
    (next_day_order d3 d4)
    (next_day_order d4 d5)
    (next_day_order d5 d6)

    ;; Counting progression (max 3 days needed for any city)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    ;; Allow saturation if counts exceed 3
    (next_count n3 n3)

    ;; City counts initialized at zero
    (count berlin n0)
    (count warsaw n0)
    (count bucharest n0)

    ;; Connectivity based on provided flight info
    (can_fly berlin warsaw)
    (can_fly warsaw berlin)
    (can_fly warsaw bucharest)
    (can_fly bucharest warsaw)
  )
  (:goal
    (and
      ;; Stay/Visit requirements: Berlin 3, Warsaw 3, Bucharest 2
      (count berlin n3)
      (count warsaw n3)
      (count bucharest n2)

      ;; Temporal constraint: Bucharest on Day 5 and Day 6
      (visited bucharest d5)
      (visited bucharest d6)

      ;; Ensure the itinerary completes 6 days
      (current_day d6)
    )
  )
)