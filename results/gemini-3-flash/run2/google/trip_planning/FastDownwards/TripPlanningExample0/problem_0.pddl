(define (problem travel_problem)
  (:domain travel_domain)
  (:objects
    florence barcelona helsinki origin - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n0 n1 n2 n3 n4 n5 n6 - amount
  )
  (:init
    ;; Starting state
    (at_city origin)
    (current_day d0)
    
    ;; Initial visit counts for all relevant cities
    (visit_count florence n0)
    (visit_count barcelona n0)
    (visit_count helsinki n0)
    
    ;; City connectivity (Direct flights only)
    (can_fly barcelona florence)
    (can_fly florence barcelona)
    (can_fly helsinki barcelona)
    (can_fly barcelona helsinki)
    
    ;; Temporal sequence
    (next_day d0 d1)
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
    
    ;; Counter sequence
    (next_amount n0 n1)
    (next_amount n1 n2)
    (next_amount n2 n3)
    (next_amount n3 n4)
    (next_amount n4 n5)
    (next_amount n5 n6)
    
    ;; Friend availability window (inclusive of day 9 to 14)
    (is_friend_window d9)
    (is_friend_window d10)
    (is_friend_window d11)
    (is_friend_window d12)
    (is_friend_window d13)
    (is_friend_window d14)
  )
  (:goal
    (and
      ;; Visit durations
      (visit_count florence n6)
      (visit_count barcelona n5)
      (visit_count helsinki n5)
      
      ;; Special condition
      (met_friend)
      
      ;; Final trip completion
      (current_day d14)
    )
  )
)