(define (problem trip_planning_example_21)
  (:domain trip_planning)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 n6 - count_step
  )
  (:init
    ;; First day definition
    (is_first_day d1)
    
    ;; Flight connectivity (bidirectional)
    (can_fly mykonos vienna)
    (can_fly vienna mykonos)
    (can_fly vienna venice)
    (can_fly venice vienna)
    
    ;; Day sequence
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    
    ;; Counter progression
    (next_step n0 n1)
    (next_step n1 n2)
    (next_step n2 n3)
    (next_step n3 n4)
    (next_step n4 n5)
    (next_step n5 n6)
    
    ;; Initial city counts
    (count mykonos n0)
    (count vienna n0)
    (count venice n0)
  )
  (:goal
    (and
      ;; Venice Workshop schedule (Days 5 to 10 inclusive = 6 days)
      (day_recorded venice d5)
      (day_recorded venice d6)
      (day_recorded venice d7)
      (day_recorded venice d8)
      (day_recorded venice d9)
      (day_recorded venice d10)
      
      ;; Stay duration requirements
      (count venice n6)
      (count mykonos n2)
      (count vienna n4)
    )
  )
)