(define (problem trip_planning_example_31_problem)
  (:domain trip_planning_example_31)
  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    ;; Starting time
    (current_day d1)
    
    ;; Starting counts for each city
    (total_visited_days frankfurt n0)
    (total_visited_days reykjavik n0)
    (total_visited_days split n0)
    
    ;; Temporal sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)
    
    ;; Counting sequence
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10)
    
    ;; Available direct flights
    (flight frankfurt reykjavik) (flight reykjavik frankfurt)
    (flight split frankfurt) (flight frankfurt split)
  )
  (:goal
    (and
      ;; The trip must span the full 10-day period (arriving at the start of day 11).
      (current_day d11)
      
      ;; Stay requirements (accumulated days)
      (total_visited_days frankfurt n2)
      (total_visited_days reykjavik n3)
      (total_visited_days split n7)
      
      ;; Workshop requirements (specific days in Reykjavik)
      (visited_on_day reykjavik d8)
      (visited_on_day reykjavik d9)
      (visited_on_day reykjavik d10)
    )
  )
)