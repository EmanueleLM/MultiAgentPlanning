(define (problem trip_planning_example_21)
  (:domain trip_planning)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    (not_started)
    ;; Flight connectivity
    (can_fly mykonos vienna)
    (can_fly vienna mykonos)
    (can_fly vienna venice)
    (can_fly venice vienna)
    
    ;; Day sequence
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    
    ;; Counter progression
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    
    ;; Initial counts
    (count mykonos s0)
    (count vienna s0)
    (count venice s0)
  )
  (:goal
    (and
      ;; Visit requirements (min stay durations)
      (count venice s6)
      (count mykonos s2)
      (count vienna s4)
      
      ;; Workshop schedule (must be present in Venice each day)
      (spent venice d5)
      (spent venice d6)
      (spent venice d7)
      (spent venice d8)
      (spent venice d9)
      (spent venice d10)
    )
  )
)