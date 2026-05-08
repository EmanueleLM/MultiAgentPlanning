(define (problem trip_planning_example_31)
  (:domain trip_planning)
  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    (not_started)
    (city_count frankfurt n0)
    (city_count reykjavik n0)
    (city_count split n0)
    
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    
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
    
    (flight frankfurt reykjavik)
    (flight reykjavik frankfurt)
    (flight split frankfurt)
    (flight frankfurt split)
  )
  (:goal
    (and
      (city_count frankfurt n2)
      (city_count reykjavik n3)
      (city_count split n7)
      (visited reykjavik d8)
      (visited reykjavik d9)
      (visited reykjavik d10)
    )
  )
)