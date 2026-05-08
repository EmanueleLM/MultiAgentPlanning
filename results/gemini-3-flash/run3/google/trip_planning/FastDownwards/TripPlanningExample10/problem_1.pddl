(define (problem trip_planning_example_10)
  (:domain trip_planning)
  
  (:objects
    oslo dublin valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    (at_start)
    (current_day d1)
    
    ;; Chronological order of days
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    
    ;; Counting progression
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    
    ;; Initial visit counts for all cities
    (count oslo c0)
    (count dublin c0)
    (count valencia c0)
    
    ;; Flight connectivity
    (can_fly oslo dublin)
    (can_fly dublin oslo)
    (can_fly dublin valencia)
    (can_fly valencia dublin)
  )

  (:goal
    (and
      ;; Spent 3 days in Oslo
      (count oslo c3)
      
      ;; Stayed in Dublin for 3 days
      (count dublin c3)
      
      ;; Spent 5 days in Valencia
      (count valencia c5)
      
      ;; Relative visit in Valencia between day 5 and day 9
      (visited valencia d5)
      (visited valencia d6)
      (visited valencia d7)
      (visited valencia d8)
      (visited valencia d9)
      
      ;; Ensure the trip lasts for the full 9 days
      (current_day d10)
    )
  )
)