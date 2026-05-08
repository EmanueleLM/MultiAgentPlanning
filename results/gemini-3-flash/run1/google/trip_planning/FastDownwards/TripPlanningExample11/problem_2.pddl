(define (problem trip_planning_example_11)
  (:domain trip_planning)
  (:objects
    vienna vilnius valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )
  (:init
    ;; Starting point
    (at vilnius d1)
    
    ;; Initial visit counts
    (count vienna n0)
    (count vilnius n0)
    (count valencia n0)
    
    ;; Day sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15)
    
    ;; Numerical sequence for counts
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7)
    
    ;; Flight connections
    (can_fly vienna valencia) (can_fly valencia vienna)
    (can_fly vienna vilnius) (can_fly vilnius vienna)
  )
  (:goal (and
    (trip_done)
    ;; Required stay durations
    (count vilnius n5)
    (count vienna n5)
    (count valencia n7)
    
    ;; Conference attendance requirements
    (visited_at valencia d9)
    (visited_at valencia d15)
  ))
)