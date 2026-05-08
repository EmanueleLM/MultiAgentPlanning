(define (problem trip_planning_example_2_problem)
  (:domain trip_planning_example_2)
  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - count
  )
  (:init
    (not_started)
    ;; City Counts Initialized to 0
    (count reykjavik n0)
    (count vienna n0)
    (count venice n0)

    ;; Day Progression
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

    ;; Count Progression
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
    (next_count n8 n9)
    (next_count n9 n10)
    (next_count n10 n11)

    ;; Direct Flight Routes
    (has_flight reykjavik vienna)
    (has_flight vienna reykjavik)
    (has_flight vienna venice)
    (has_flight venice vienna)
  )
  (:goal
    (and
      ;; Visit Reykjavik for 2 days
      (count reykjavik n2)
      ;; Visit Vienna for 7 days
      (count vienna n7)
      ;; Visit Venice for 4 days
      (count venice n4)
      ;; Wedding in Venice between day 8 and day 11
      (visited venice d8)
      (visited venice d9)
      (visited venice d10)
      (visited venice d11)
    )
  )
)