(define (problem trip_planning_example_7)
  (:domain trip_planning)
  (:objects
    dubrovnik istanbul venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
    n0 n1 n2 n3 n4 n5 n6 - step_count
  )
  (:init
    (at dubrovnik)
    (current_day day_1)
    
    (visit_count dubrovnik n0)
    (visit_count istanbul n0)
    (visit_count venice n0)
    
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    
    (flight dubrovnik istanbul)
    (flight istanbul venice)
  )
  (:goal (and
    (visit_count dubrovnik n4)
    (visit_count istanbul n3)
    (visit_count venice n6)
  ))
)