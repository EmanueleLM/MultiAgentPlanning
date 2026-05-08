(define (problem trip_plan_12_days)
  (:domain trip_planning)
  (:objects
    venice zurich florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    n0 n1 n2 n3 n4 n5 n6 - count
  )
  (:init
    ;; Starting conditions
    (at venice)
    (current_day d1)
    
    ;; Initial stay counts
    (visited_count venice n0)
    (visited_count zurich n0)
    (visited_count florence n0)
    
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
    (next_day d10 d11)
    (next_day d11 d12)
    (is_last_day d12)
    
    ;; Count sequence
    (next_val n0 n1)
    (next_val n1 n2)
    (next_val n2 n3)
    (next_val n3 n4)
    (next_val n4 n5)
    (next_val n5 n6)
    
    ;; Flight connectivity
    (can_fly venice zurich)
    (can_fly zurich venice)
    (can_fly zurich florence)
  )
  (:goal
    (and
      (trip_done)
      (visited_count venice n6)
      (visited_count zurich n2)
      (visited_count florence n6)
    )
  )
)