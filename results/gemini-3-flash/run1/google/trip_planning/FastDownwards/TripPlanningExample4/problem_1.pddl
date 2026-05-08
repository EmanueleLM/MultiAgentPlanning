(define (problem trip_planning_example_4_problem)
  (:domain trip_planning_example_4)
  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 - count
  )
  (:init
    ;; Initial location and day
    (at seville d1)
    
    ;; Initial stay counts (Day 1 in Seville counts as 1)
    (stay_count seville n1)
    (stay_count munich n0)
    (stay_count tallinn n0)
    
    ;; Temporal sequence
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
    
    ;; Counting sequence
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
    (next_count n11 n12)
    
    ;; Direct flight connections
    (can_fly seville munich)
    (can_fly munich seville)
    (can_fly munich tallinn)
    (can_fly tallinn munich)
  )
  (:goal
    (and
      ;; Visit Tallinn for 2 days
      (stay_count tallinn n2)
      
      ;; Visit Seville for 7 days
      (stay_count seville n7)
      
      ;; Stay in Munich for 5 days
      (stay_count munich n5)
      
      ;; Meet a friend in Tallinn between day 11 and day 12
      (at tallinn d11)
      (at tallinn d12)
    )
  )
)