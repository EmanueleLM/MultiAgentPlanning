(define (problem tripplanningexample49)
  (:domain trip_planning)
  (:objects
    reykjavik milan split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    s0 s1 s2 s3 s4 s5 s6 s7 - step
  )
  (:init
    ;; Starting point
    (at split d1)
    (is_split_city split)
    
    ;; Initial counts
    (count split s1)
    (count milan s0)
    (count reykjavik s0)
    
    ;; Connections (Bidirectional flights)
    (connected milan reykjavik)
    (connected reykjavik milan)
    (connected split milan)
    (connected milan split)
    
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
    
    ;; Step sequence (for counting days)
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)
    (next_step s4 s5)
    (next_step s5 s6)
    (next_step s6 s7)
    
    ;; Relative visit window
    (is_split_window d1)
    (is_split_window d2)
    (is_split_window d3)
  )
  (:goal
    (and
      ;; Total duration in each city
      (count split s3)
      (count milan s7)
      (count reykjavik s5)
      
      ;; Visiting relatives in Split on days 1, 2, and 3
      (visited_relatives d1)
      (visited_relatives d2)
      (visited_relatives d3)
      
      ;; Ensure the trip lasts through day 13
      (at reykjavik d13)
    )
  )
)