(define (problem trip_planning_example_12)
  (:domain trip_planning)
  (:objects
    valencia amsterdam tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    (not_started)
    (is_tallinn tallinn)
    (is_start_day d1)
    (is_end_day d15)
    
    ;; Flight connectivity
    (can_fly valencia amsterdam)
    (can_fly amsterdam valencia)
    (can_fly amsterdam tallinn)
    (can_fly tallinn amsterdam)
    
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
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)
    
    ;; Friend window
    (is_friend_window d9)
    (is_friend_window d10)
    (is_friend_window d11)
    (is_friend_window d12)
    (is_friend_window d13)
    (is_friend_window d14)
    (is_friend_window d15)
    
    ;; Count sequence
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    
    ;; Initial stay counts
    (spent valencia c0)
    (spent amsterdam c0)
    (spent tallinn c0)
  )
  (:goal
    (and
      (spent valencia c5)
      (spent amsterdam c5)
      (spent tallinn c7)
      (friend_met)
      (trip_finished)
    )
  )
)