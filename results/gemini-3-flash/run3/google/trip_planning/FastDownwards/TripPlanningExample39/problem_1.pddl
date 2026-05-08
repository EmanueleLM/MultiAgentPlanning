(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    porto barcelona florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting state: assume starting in Porto to accommodate the early relative visit constraint
    (at_city porto)
    (current_day d1)
    
    ;; Initializing stay counters for each city
    (spent porto c0)
    (spent barcelona c0)
    (spent florence c0)
    
    ;; Temporal constraints for relative visit (Day 1 to 3)
    (is_valid_relative_day d1)
    (is_valid_relative_day d2)
    (is_valid_relative_day d3)
    
    ;; Defining chronological order of days (limiting to 12 total steps)
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
    
    ;; Defining numeric increments for stay counts
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    
    ;; Flight network
    (can_fly porto barcelona)
    (can_fly barcelona porto)
    (can_fly barcelona florence)
    (can_fly florence barcelona)
  )
  (:goal
    (and
      ;; 3 days in Porto
      (spent porto c3)
      ;; 7 days in Barcelona
      (spent barcelona c7)
      ;; 4 days in Florence
      (spent florence c4)
      ;; Visit relatives in Porto (between day 1 and 3)
      (relatives_visited)
    )
  )
)