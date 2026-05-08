(define (problem trip_planning_example_31_problem)
  (:domain trip_planning_example_31)
  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    ;; Starting location and time
    (at_city split)
    (day_at d1)
    
    ;; Starting visit counts for each city
    (city_visit_count frankfurt n0)
    (city_visit_count reykjavik n0)
    (city_visit_count split n0)
    
    ;; Temporal sequence (10 days total, ending at d11)
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)
    
    ;; Counting sequence
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10)
    
    ;; Available direct flight routes
    (connected frankfurt reykjavik) (connected reykjavik frankfurt)
    (connected split frankfurt) (connected frankfurt split)
  )
  (:goal
    (and
      ;; The trip must span the full 10-day period.
      (day_at d11)
      
      ;; Stay requirements (total days spent in each city)
      (city_visit_count frankfurt n2)
      (city_visit_count reykjavik n3)
      (city_visit_count split n7)
      
      ;; Workshop requirements: Must be in Reykjavik on days 8, 9, and 10.
      (visited_on reykjavik d8)
      (visited_on reykjavik d9)
      (visited_on reykjavik d10)
    )
  )
)