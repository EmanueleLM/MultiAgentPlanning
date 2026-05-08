(define (problem trip_planning_example_15_prob)
  (:domain trip_planning)
  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 - count
  )
  (:init
    ;; Person is ready to begin the trip
    (not_started)
    (is_day_one d1)
    
    ;; Initial counts for all cities are zero
    (current_count berlin c0)
    (current_count porto c0)
    (current_count krakow c0)
    
    ;; Temporal sequence
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
    
    ;; Successor counts
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
    
    ;; Flight routes
    (can_fly berlin porto)
    (can_fly porto berlin)
    (can_fly krakow berlin)
    (can_fly berlin krakow)
  )
  (:goal
    (and
      ;; Specific day constraints: Wedding in Porto on Day 10 and 11
      (at_city porto d10)
      (at_city porto d11)
      
      ;; Stay duration requirements
      (current_count berlin c6)
      (current_count porto c2)
      (current_count krakow c5)
    )
  )
)