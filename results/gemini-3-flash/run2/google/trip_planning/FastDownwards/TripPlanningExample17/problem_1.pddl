(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    copenhagen vienna lyon - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 - count
  )
  (:init
    ;; Starting timeline
    (at_day d0)
    
    ;; Initial stay counts for all cities
    (stay_count copenhagen c0)
    (stay_count vienna c0)
    (stay_count lyon c0)
    
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
    
    ;; Count sequence for stay duration tracking
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)
    
    ;; Flight connectivity
    (flight copenhagen vienna)
    (flight vienna copenhagen)
    (flight vienna lyon)
    (flight lyon vienna)
    
    ;; City availability per day (including conference constraints)
    ;; Day 1: Conference in Copenhagen
    (available copenhagen d1)
    
    ;; Day 2: Free
    (available copenhagen d2)
    (available vienna d2)
    (available lyon d2)
    
    ;; Day 3: Free
    (available copenhagen d3)
    (available vienna d3)
    (available lyon d3)
    
    ;; Day 4: Free
    (available copenhagen d4)
    (available vienna d4)
    (available lyon d4)
    
    ;; Day 5: Conference in Copenhagen
    (available copenhagen d5)
    
    ;; Day 6: Free
    (available copenhagen d6)
    (available vienna d6)
    (available lyon d6)
    
    ;; Day 7: Free
    (available copenhagen d7)
    (available vienna d7)
    (available lyon d7)
    
    ;; Day 8: Free
    (available copenhagen d8)
    (available vienna d8)
    (available lyon d8)
    
    ;; Day 9: Free
    (available copenhagen d9)
    (available vienna d9)
    (available lyon d9)
    
    ;; Day 10: Free
    (available copenhagen d10)
    (available vienna d10)
    (available lyon d10)
    
    ;; Day 11: Free
    (available copenhagen d11)
    (available vienna d11)
    (available lyon d11)
  )
  (:goal
    (and
      ;; Reach the final day
      (at_day d11)
      ;; Requirement for Copenhagen: 5 days total
      (stay_count copenhagen c5)
      ;; Requirement for Vienna: 4 days total
      (stay_count vienna c4)
      ;; Requirement for Lyon: 4 days total
      (stay_count lyon c4)
    )
  )
)