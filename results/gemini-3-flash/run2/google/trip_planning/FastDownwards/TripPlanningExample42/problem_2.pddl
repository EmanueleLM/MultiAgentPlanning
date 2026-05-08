(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    ;; Starting conditions
    (at_city paris d1)
    (day_count paris n0)
    (day_count nice n0)
    (day_count mykonos n0)

    ;; Temporal progression (11 days total = 11 steps)
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

    ;; Counter sequence (for city stay tracking)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)

    ;; Flight network (bi-directional as per "between")
    (has_flight paris nice)
    (has_flight nice paris)
    (has_flight nice mykonos)
    (has_flight mykonos nice)
  )
  (:goal
    (and
      ;; City stay requirements
      ;; Paris: 4 days (n4)
      ;; Nice: 5 days (n5)
      ;; Mykonos: 4 days (n4)
      (day_count paris n4)
      (day_count nice n5)
      (day_count mykonos n4)

      ;; Specific time constraint for Paris friends
      (visited paris d1)
      (visited paris d2)
      (visited paris d3)
      (visited paris d4)
    )
  )
)