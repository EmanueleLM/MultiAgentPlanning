(define (problem trip_planning_example_27_problem)
  (:domain trip_planning_example_27)
  (:objects
    istanbul amsterdam santorini - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 - count
  )
  (:init
    ;; Initialize current time and counts
    (current_day d1)
    
    ;; Temporal sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5) (next_day d5 d6) 
    (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10) (next_day d10 d11) 
    (next_day d11 d12) (next_day d12 d13) (next_day d13 d14)

    ;; Counting sequence
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4) (next_count c4 c5) 
    (next_count c5 c6) (next_count c6 c7) (next_count c7 c8) (next_count c8 c9) (next_count c9 c10) 
    (next_count c10 c11) (next_count c11 c12) (next_count c12 c13) (next_count c13 c14)

    ;; Initial counts for all cities
    (at_count istanbul c0)
    (at_count amsterdam c0)
    (at_count santorini c0)

    ;; Available flight connections
    (can_fly amsterdam santorini)
    (can_fly santorini amsterdam)
    (can_fly istanbul amsterdam)
    (can_fly amsterdam istanbul)
  )
  (:goal
    (and
      ;; Reach the end of the 14-day trip
      (current_day d14)

      ;; Santorini duration: at least 3 days
      (or (at_count santorini c3) (at_count santorini c4) (at_count santorini c5) (at_count santorini c6) 
          (at_count santorini c7) (at_count santorini c8) (at_count santorini c9) (at_count santorini c10) 
          (at_count santorini c11) (at_count santorini c12) (at_count santorini c13) (at_count santorini c14))

      ;; Amsterdam duration: at least 7 days
      (or (at_count amsterdam c7) (at_count amsterdam c8) (at_count amsterdam c9) (at_count amsterdam c10) 
          (at_count amsterdam c11) (at_count amsterdam c12) (at_count amsterdam c13) (at_count amsterdam c14))

      ;; Istanbul duration: at least 6 days
      (or (at_count istanbul c6) (at_count istanbul c7) (at_count istanbul c8) (at_count istanbul c9) 
          (at_count istanbul c10) (at_count istanbul c11) (at_count istanbul c12) (at_count istanbul c13) 
          (at_count istanbul c14))

      ;; Santorini relatives requirement: Between Day 12 and Day 14
      (at_day santorini d12)
      (at_day santorini d13)
      (at_day santorini d14)
    )
  )
)