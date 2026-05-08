(define (problem trip_planning_example_27_problem)
  (:domain trip_planning_example_27)
  (:objects
    istanbul amsterdam santorini - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 - count
  )
  (:init
    ;; Initialize current time
    (current_day d1)
    
    ;; Temporal adjacency for 14 days
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5) (next_day d5 d6) 
    (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10) (next_day d10 d11) 
    (next_day d11 d12) (next_day d12 d13) (next_day d13 d14)

    ;; Counting sequence for durations
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4) (next_count c4 c5) 
    (next_count c5 c6) (next_count c6 c7) (next_count c7 c8) (next_count c8 c9) (next_count c9 c10) 
    (next_count c10 c11) (next_count c11 c12) (next_count c12 c13) (next_count c13 c14)

    ;; Initial visit counts for all cities
    (at_count istanbul c0)
    (at_count amsterdam c0)
    (at_count santorini c0)

    ;; Direct flight network
    (can_fly amsterdam santorini)
    (can_fly santorini amsterdam)
    (can_fly istanbul amsterdam)
    (can_fly amsterdam istanbul)
  )
  (:goal
    (and
      ;; Total trip duration reached
      (current_day d14)

      ;; Istanbul duration: 6 days
      (at_count istanbul c6)

      ;; Amsterdam duration: 7 days
      (at_count amsterdam c7)

      ;; Santorini duration: 3 days
      (at_count santorini c3)

      ;; Relative visit window in Santorini: Day 12 to Day 14
      (at_day santorini d12)
      (at_day santorini d13)
      (at_day santorini d14)
    )
  )
)