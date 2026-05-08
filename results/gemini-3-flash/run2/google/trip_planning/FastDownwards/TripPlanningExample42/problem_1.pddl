(define (problem trip_planning_example_42_problem)
  (:domain trip_planning_example_42)
  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d_end - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    ;; Sequence of days
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
    (next_day d11 d_end)

    ;; Counter sequence
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)

    ;; Flight connectivity
    (has_flight paris nice)
    (has_flight nice paris)
    (has_flight nice mykonos)
    (has_flight mykonos nice)

    ;; Initial counters for each city
    (day_count paris n0)
    (day_count nice n0)
    (day_count mykonos n0)

    ;; Starting condition
    (at_start paris d1)
  )
  (:goal
    (and
      ;; Total stay requirements
      (day_count paris n4)
      (day_count nice n5)
      (day_count mykonos n4)

      ;; Friend constraint: Stay in Paris between day 1 and day 4
      (visited paris d1)
      (visited paris d2)
      (visited paris d3)
      (visited paris d4)

      ;; Trip must be completed (11 days)
      (trip_ended)
    )
  )
)