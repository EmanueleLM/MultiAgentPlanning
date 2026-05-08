(define (problem trip_planning_example_8)
  (:domain trip_planning)
  (:objects
    athens zurich krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )
  (:init
    ;; Starting point: Athens on Day 1
    (at athens d1)
    (count athens n1)
    (count zurich n0)
    (count krakow n0)

    ;; City connectivity
    (can_fly zurich krakow)
    (can_fly krakow zurich)
    (can_fly athens zurich)
    (can_fly zurich athens)

    ;; Day progression
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
    (next_day d14 d15)
    (next_day d15 d16)

    ;; Count progression
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
  )
  (:goal
    (and
      ;; Total city durations
      (count athens n7)
      (count zurich n5)
      (count krakow n6)
      
      ;; Final state must be at the end of the 16-day period
      (at krakow d16)
    )
  )
)