(define (problem trip_example_17)
  (:domain trip_planning)
  (:objects
    copenhagen vienna lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    c0 c1 c2 c3 c4 c5 - count
  )
  (:init
    ;; Starting state: in Copenhagen on Day 1
    (at_city copenhagen)
    (current_day d1)
    
    ;; Initial stay counts
    (stay_count copenhagen c0)
    (stay_count vienna c0)
    (stay_count lyon c0)
    
    ;; Temporal sequence for 11 days (trip ends when moving to d12)
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
    
    ;; Counting sequence
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    
    ;; Flight connectivity
    (flight copenhagen vienna)
    (flight vienna copenhagen)
    (flight vienna lyon)
    (flight lyon vienna)
  )
  (:goal
    (and
      ;; Total trip duration: 11 days (reaching state d12)
      (current_day d12)
      
      ;; Stay duration requirements
      (stay_count copenhagen c5)
      (stay_count vienna c4)
      (stay_count lyon c4)
      
      ;; Conference constraints
      (visited copenhagen d1)
      (visited copenhagen d5)
    )
  )
)